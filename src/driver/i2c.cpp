#include "driver/i2c.h"
#include "driver/gpio.h"
#include "driver/timer.h"

#include <chrono>

using namespace wallet::driver;

inline void delay(const timer::PhysicalTimer& timer)
{
    volatile bool done = false;

    timer::CallbackFunc func {
        .func = [](void *ctx) -> void {
            *static_cast<volatile bool*>(ctx) = true;
        },
        .ctx = const_cast<bool*>(&done)
    };

    auto _ = timer.handle(func);
    _ = timer.start();

    // block until interval has passed
    while (!done) asm volatile ("nop");
}

i2c::Device::Device(timer::PhysicalTimer timer, gpio::Device scl, gpio::Device sda, const std::uint8_t address)
    :   timer(std::move(timer)),
        scl(std::move(scl)),
        sda(std::move(sda)),
        address(address)
{
    auto _ = timer.interval(std::chrono::microseconds(5));
    _ = timer.repeat(false);
}

std::expected<i2c::Device, DriverError> i2c::Device::open(timer::PhysicalTimer timer, const gpio::Pin scl, const gpio::Pin sda, const std::uint8_t address)
{
    auto sclGpio = gpio::Device::open(gpio::Mode::Output, gpio::Type::OpenDrain, gpio::Speed::Low, gpio::PullType::PullUp, scl);
    auto sdaGpio = gpio::Device::open(gpio::Mode::Output, gpio::Type::OpenDrain, gpio::Speed::Low, gpio::PullType::PullUp, sda);

    if (!sclGpio.has_value())
        return std::unexpected(sclGpio.error());

    if (!sdaGpio.has_value())
        return std::unexpected(sdaGpio.error());

    return std::expected<Device, DriverError>(Device(std::move(timer), std::move(*sclGpio), std::move(*sdaGpio), address));
}

std::expected<i2c::Stream, DriverError> i2c::Device::open_stream()
{
    Stream stream(this->timer, this->scl, this->sda, this->address);

    if (auto err = stream.start(); !err.has_value())
    {
        return std::unexpected(err.error());
    }

    return std::expected<Stream, DriverError>(std::move(stream));
}

i2c::Stream::Stream(const timer::PhysicalTimer& timer, gpio::Device& scl, gpio::Device& sda, const std::uint8_t address)
    : timer(timer), scl(scl), sda(sda), address(address), open(false)
{}

i2c::Stream::Stream(Stream&& old) noexcept
    :   timer(old.timer),
        scl(old.scl),
        sda(old.sda),
        address(old.address),
        open(old.open)
{
    old.open = false;
}

i2c::Stream& i2c::Stream::operator=(Stream&& old) noexcept
{
    if (this != &old)
    {
        if (this->open)
        {
            auto _ = this->stop();
        }

        this->open = old.open;
        old.open = false;
    }

    return *this;
}

i2c::Stream::~Stream()
{
    if (this->open)
    {
        auto _ = this->stop();
    }
}

std::expected<void, DriverError> i2c::Stream::write_bytes(const std::uint8_t *data, const std::size_t size)
{
    for (std::size_t i = 0; i < size; i++)
    {
        if (auto err = this->write_byte(data[i]); !err.has_value())
        {
            auto _ = this->stop();
            return err;
        }
    }

    return {};
}

std::expected<void, DriverError> i2c::Stream::start()
{
    if (open)
    {
        return std::unexpected(DriverError::IllegalState);
    }

    if (auto err = this->sda.set(true); !err.has_value()) return err;
    if (auto err = this->scl.set(true); !err.has_value()) return err;
    delay(this->timer);

    // send start condition: drain SDA while SCL is still HIGH
    if (auto err = this->sda.set(false); !err.has_value())
        return err;

    // wait a half period
    delay(this->timer);

    // pull SCL to LOW
    if (auto err = this->scl.set(false); !err.has_value())
        return err;

    delay(this->timer);

    this->open = true;

    if (auto err = this->write_byte(this->address << 1); !err.has_value())
    {
        auto _ = this->stop();
        return err;
    }

    return {};
}

std::expected<void, DriverError> i2c::Stream::write_byte(std::uint8_t byte)
{
    if (!open)
    {
        return std::unexpected(DriverError::IllegalState);
    }

    for (std::uint8_t i = 0; i < 8; i++)
    {
        if (auto err = this->sda.set(byte & 0x80 ? true : false); !err.has_value())
            return err;

        // next bit
        byte <<= 1;

        // wait a half period
        delay(this->timer);

        if (auto err = this->scl.set(true); !err.has_value())
            return err;

        delay(this->timer);

        if (auto err = this->scl.set(false); !err.has_value())
            return err;
    }

    // stop pulling SDA to LOW
    if (auto err = this->sda.set(true); !err.has_value())
        return err;

    delay(this->timer);

    // checking for acknowledge bit
    if (auto err = this->scl.set(true); !err.has_value())
        return err;

    delay(this->timer);

    auto acknowledged = this->sda.get();
    if (!acknowledged.has_value())
        return std::unexpected(acknowledged.error());

    if (acknowledged.value())
        return std::unexpected(DriverError::NotAcknowledged);

    if (auto err = this->scl.set(false); !err.has_value())
        return err;

    return {};
}

std::expected<void, DriverError> i2c::Stream::stop()
{
    // drain SDA to LOW because I2C requires a rising edge on SDA while SCL is HIGH
    if (auto err = this->sda.set(false); !err.has_value())
        return err;

    delay(this->timer);

    // stop condition: set SCL to HIGH
    if (auto err = this->scl.set(true); !err.has_value())
        return err;

    delay(this->timer);

    // set SDA to HIGH while SCL is already HIGH
    if (auto err = this->sda.set(true); !err.has_value())
        return err;

    this->open = false;

    return {};
}