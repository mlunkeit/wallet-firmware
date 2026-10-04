#include <utility>
#include <stm32f4xx.h>

#include "driver/buzzer.h"
#include "driver/i2c.h"
#include "service/scheduler.h"

using namespace wallet;

extern "C"
{
    int main(void);
}

void enable_120mhz()
{
    // enable HSI clock
    RCC->CR |= RCC_CR_HSION;

    // wait until HSI clock is stable
    while (!(RCC->CR & RCC_CR_HSIRDY))
    {
        asm volatile("nop");
    }

    // Enable power interface clock
    RCC->APB1ENR |= RCC_APB1ENR_PWREN;

    (void)RCC->APB1ENR;

    // Set regulator voltage scaling to Scale 1 (<= 100MHz)
    PWR->CR |= PWR_CR_VOS;

    RCC->CFGR |= RCC_CFGR_HPRE_DIV1 | RCC_CFGR_PPRE1_DIV4 | RCC_CFGR_PPRE2_DIV2;

    constexpr uint32_t pll_m = 16;
    constexpr uint32_t pll_n = 240;
    constexpr uint32_t pll_p = 0;
    constexpr uint32_t pll_q = 4;

    RCC->PLLCFGR = pll_m << RCC_PLLCFGR_PLLM_Pos
                    | pll_n << RCC_PLLCFGR_PLLN_Pos
                    | pll_p << RCC_PLLCFGR_PLLP_Pos
                    | pll_q << RCC_PLLCFGR_PLLQ_Pos
                    | RCC_PLLCFGR_PLLSRC_HSI;

    RCC->CR |= RCC_CR_PLLON;
    while (!(RCC->CR & RCC_CR_PLLRDY))
    {
        asm volatile("nop");
    }

    FLASH->ACR = FLASH_ACR_LATENCY_2WS | FLASH_ACR_PRFTEN | FLASH_ACR_ICEN | FLASH_ACR_DCEN;

    RCC->CFGR &= ~RCC_CFGR_SW;
    RCC->CFGR |= RCC_CFGR_SW_PLL;

    while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_PLL)
    {
        asm volatile("nop");
    }
}

int main()
{
    enable_120mhz();

    if (const auto exp = driver::timer::require(driver::timer::Tim5); !exp.has_value()) return 1;
    if (const auto exp = driver::timer::require(driver::timer::Tim3); !exp.has_value()) return 1;
    if (const auto exp = driver::timer::require(driver::timer::Tim2); !exp.has_value()) return 1;

    if (const auto exp = driver::gpio::require(driver::gpio::Port::A); !exp.has_value()) return 1;
    if (const auto exp = driver::gpio::require(driver::gpio::Port::B); !exp.has_value()) return 1;

    auto buzzerTimer = driver::timer::PhysicalTimer::open(driver::timer::Tim5);
    auto i2cTimer = driver::timer::PhysicalTimer::open(driver::timer::Tim3);
    auto masterTimer = driver::timer::PhysicalTimer::open(driver::timer::Tim2);

    if (!buzzerTimer.has_value()) return 1;
    if (!i2cTimer.has_value()) return 1;

    auto i2cDev = driver::i2c::Device::open(std::move(*i2cTimer),
        driver::gpio::Pin { .port = driver::gpio::Port::B, .num = 7 },
        driver::gpio::Pin { .port = driver::gpio::Port::B, .num = 6 },
        0x3C);

    std::uint8_t oled_full_init[] = {
        0x00, // Co = 0, D/C# = 0 -> Command Stream

        0xAE,       // 1. Display OFF
        0xD5, 0x80, // 2. Set Display Clock Divide Ratio / Oscillator Frequency (Default: 0x80)
        0xA8, 0x3F, // 3. Set Multiplex Ratio (1/64 Duty für 128x64)
        0xD3, 0x00, // 4. Set Display Offset (0x00)
        0x40,       // 5. Set Display Start Line (0x00)

        0x8D, 0x14, // 6. Charge Pump ENABLE

        0x20, 0x00, // 7. Set Memory Addressing Mode -> Horizontal Addressing Mode
        0xA1,       // 8. Set Segment Re-map
        0xC8,       // 9. Set COM Output Scan Direction
        0xDA, 0x12, // 10. Set COM Pins Hardware Configuration
        0x81, 0xCF, // 11. Set Contrast Control
        0xD9, 0xF1, // 12. Set Pre-Charge Period
        0xDB, 0x40, // 13. Set VCOMH Deselect Level

        0xA5,       // 14. Entire Display ON (Schaltet testweise ALLE Pixel an, ignoriert RAM)
        0xAF        // 15. Display Power ON
    };
    if (const auto exp = i2cDev->transmit(oled_full_init, sizeof(oled_full_init)); !exp.has_value()) return 1;

    auto bzres = driver::buzzer::Passive::open(buzzerTimer.value(), driver::gpio::Pin { .port = driver::gpio::Port::A, .num = 3 });
    if (!bzres.has_value()) return 1;

    auto buzzer (std::move(bzres.value()));

    if (!masterTimer.has_value()) return 1;
    service::scheduler::Scheduler scheduler(std::move(masterTimer.value()));

    auto stopFunc = service::scheduler::ScheduledFunction {
        .func = [](void *ctx) -> void { auto _ = static_cast<driver::buzzer::Passive*>(ctx)->stop(); },
        .ctx = &buzzer
    };

    auto _ = scheduler.set_timeout(std::chrono::milliseconds(1000), stopFunc);

    if (const auto exp = buzzer.frequency(3000); !exp.has_value()) return 1;
    if (const auto exp = buzzer.start(); !exp.has_value()) return 1;

    while (true) { asm volatile("nop"); }

    return 0;
}
