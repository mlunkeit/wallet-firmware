#include <utility>
#include <stm32f4xx.h>

#include "driver/buzzer.h"

using namespace wallet;

extern "C"
{
    int main(void);
}

int main()
{
    if (const auto exp = driver::timer::require(driver::timer::Tim5); !exp.has_value())
    {
        return 1;
    }

    if (const auto exp = driver::gpio::require(driver::gpio::Port::A); !exp.has_value())
    {
        return 1;
    }

    auto timer = driver::timer::PhysicalTimer::open(driver::timer::Tim5);

    if (!timer.has_value())
    {
        return 1;
    }

    auto result = driver::buzzer::Passive::open(timer.value(), driver::gpio::Pin { .port = driver::gpio::Port::A, .num = 3 });

    if (!result.has_value())
    {
        return 1;
    }

    const driver::buzzer::Passive buzzer (std::move(result.value()));

    if (const auto exp = buzzer.frequency(3000); !exp.has_value())
    {
        return 1;
    }

    if (const auto exp = buzzer.start(); !exp.has_value())
    {
        return 1;
    }

    while (true) { asm volatile("nop"); }

    return 0;
}
