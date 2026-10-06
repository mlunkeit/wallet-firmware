#include <utility>
#include <stm32f4xx.h>

#include "driver/buzzer.h"
#include "driver/display.h"
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

    for (int i = 0; i < 500'000; ++i) asm volatile ("nop");

    driver::display::SSD1306 ssd1306(std::move(i2cDev.value()));
    if (const auto exp = ssd1306.initialize(); !exp.has_value()) return 1;

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
