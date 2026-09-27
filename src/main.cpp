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
    auto reqresult = driver::gpio::require(driver::gpio::Port::A);
    if (!reqresult.has_value())
    {
        return 1;
    }

    auto result = driver::buzzer::Passive::open(driver::gpio::Pin { .port = driver::gpio::Port::A, .num = 3 });

    if (!result.has_value())
    {
        return 1;
    }

    const auto buzzer = std::move(result.value());

    if (const auto res = buzzer.play(440, std::chrono::milliseconds(5000)); !res.has_value())
    {
        return 1;
    }

    while (true)
    {

    }

    return 0;
}
