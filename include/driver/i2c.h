#ifndef WALLET_FIRMWARE_I2C_H
#define WALLET_FIRMWARE_I2C_H

#include "driver/common.h"
#include "driver/gpio.h"
#include "driver/timer.h"

namespace wallet::driver::i2c
{
    class Stream
    {
    public:
        Stream(Stream&) = delete;
        Stream& operator=(Stream&) = delete;

        Stream(Stream&&) noexcept;
        Stream& operator=(Stream&&) noexcept;

        explicit Stream(const timer::PhysicalTimer& timer, gpio::Device& scl, gpio::Device& sda, std::uint8_t address);
        ~Stream();

        [[nodiscard]] std::expected<void, DriverError> start();
        [[nodiscard]] std::expected<void, DriverError> stop();

        [[nodiscard]] std::expected<void, DriverError> write_byte(std::uint8_t byte);
        [[nodiscard]] std::expected<void, DriverError> write_bytes(const std::uint8_t *data, std::size_t size);

    private:
        const timer::PhysicalTimer& timer;
        const gpio::Device& scl;
        const gpio::Device& sda;
        std::uint8_t address;
        bool open;
    };

    class Device
    {
    public:
        Device(const Device&) = delete;
        Device& operator=(const Device&) = delete;

        Device(Device&&) noexcept = default;
        Device& operator=(Device&&) noexcept = default;

        static std::expected<Device, DriverError> open(timer::PhysicalTimer timer, gpio::Pin scl, gpio::Pin sda, std::uint8_t address);

        [[nodiscard]] std::expected<Stream, DriverError> open_stream();

    private:
        Device(timer::PhysicalTimer timer, gpio::Device scl, gpio::Device sda, std::uint8_t address);

        timer::PhysicalTimer timer;
        gpio::Device scl;
        gpio::Device sda;
        std::uint8_t address;
    };
}

#endif //WALLET_FIRMWARE_I2C_H
