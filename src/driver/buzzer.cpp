#include "driver/buzzer.h"

#include <utility>

using namespace wallet::driver;

buzzer::Passive::Passive(gpio::Device dev): dev(std::move(dev)) {}

std::expected<buzzer::Passive, DriverError> buzzer::Passive::open(const gpio::Pin pin)
{
    return gpio::Device::open(gpio::Mode::Output, gpio::Type::PushPull, gpio::Speed::Low, gpio::PullType::PullDown, pin)
        .and_then([](gpio::Device device) -> std::expected<Passive, DriverError>
        {
            return Passive(std::move(device));
        });
}

std::expected<void, DriverError> buzzer::Passive::play(const std::uint32_t frequency, const std::uint32_t milliseconds) const
{
    const std::uint32_t period_ns = 1000000 / frequency;
    const std::uint32_t half_period_ns = period_ns >> 1;

    // periods = time / (time / period)
    const std::uint32_t periods = milliseconds * 1000 / period_ns;

    for (std::uint32_t i = 0; i < periods; ++i)
    {
        if (auto success = this->dev.set(true); !success.has_value())
        {
            return std::unexpected(success.error());
        }

        sleep(half_period_ns);

        if (auto success = this->dev.set(false); !success.has_value())
        {
            return std::unexpected(success.error());
        }

        sleep(half_period_ns);
    }

    return {};
}
