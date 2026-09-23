#include <utility>

#include "driver/buzzer.h"

using namespace wallet;

int main()
{
    auto result = driver::buzzer::Passive::open(driver::gpio::Pin { .port = driver::gpio::Port::A, .num = 3 });

    if (!result.has_value())
    {
        return 1;
    }

    while (true)
    {
        const auto buzzer = std::move(result.value());

        // playing 440Hz for 5 seconds
        if (const auto res = buzzer.play(440, 5000); !res.has_value())
        {
            return 1;
        }

        driver::sleep(5'000'000);
    }

    return 0;
}
