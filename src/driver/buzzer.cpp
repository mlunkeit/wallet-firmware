#include "driver/buzzer.h"

#include <utility>

using namespace wallet::driver;

static buzzer::Passive *instance;

buzzer::Passive::Passive(Passive&& old) noexcept : timer(old.timer), dev(std::move(old.dev)), state(old.state)
{
    if (instance == &old)
        instance = this;
}

buzzer::Passive::Passive(const timer::PhysicalTimer& timer, gpio::Device dev) : timer(timer), dev(std::move(dev)), state(false)
{
    instance = this;

    this->timer.handle([]() -> void
    {
        if (instance != nullptr)
        {
            instance->toggle();
        }
    });
}

buzzer::Passive::~Passive()
{
    if (instance == this)
        instance = nullptr;
}

std::expected<buzzer::Passive, DriverError> buzzer::Passive::open(const timer::PhysicalTimer& timer, const gpio::Pin pin)
{
    return gpio::Device::open(gpio::Mode::Output, gpio::Type::PushPull, gpio::Speed::Low, gpio::PullType::PullDown, pin)
        .and_then([&timer](gpio::Device device) -> std::expected<Passive, DriverError>
        {
            if (instance != nullptr)
                return std::unexpected(DriverError::ResourceOccupied);

            return std::expected<Passive, DriverError>(Passive(timer, std::move(device)));
        });
}

std::expected<void, DriverError> buzzer::Passive::frequency(const std::uint32_t frequency) const
{
    const std::uint64_t period_ns = 1'000'000'000 / frequency;
    const std::uint64_t half_period_ns = period_ns >> 1;

    return this->timer.interval(std::chrono::nanoseconds(half_period_ns));
}

void buzzer::Passive::toggle()
{
    this->state ^= true;
    auto _ = this->dev.set(this->state);
}

std::expected<void, DriverError> buzzer::Passive::start() const
{
    return this->timer.start();
}

std::expected<void, DriverError> buzzer::Passive::stop() const
{
    return this->timer.stop();
}