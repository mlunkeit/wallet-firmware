#ifndef WALLET_FIRMWARE_I2C_H
#define WALLET_FIRMWARE_I2C_H

#include "driver/common.h"
#include "driver/gpio.h"
#include "driver/timer.h"

namespace wallet::driver::i2c
{
    class Device
    {
    public:
        Device(Device&) = delete;
        Device& operator=(Device&) = delete;

        explicit Device(Device&&) noexcept;

        static std::expected<Device, DriverError> open(timer::PhysicalTimer timer, gpio::Pin scl, gpio::Pin sda, std::uint8_t address);

        [[nodiscard]] std::expected<void, DriverError> transmit(const std::uint8_t *data, std::size_t size) const;

    private:
        Device(timer::PhysicalTimer timer, gpio::Device scl, gpio::Device sda, std::uint8_t address);
        [[nodiscard]] std::expected<void, DriverError> start() const;
        [[nodiscard]] std::expected<void, DriverError> write(std::uint8_t byte) const;
        [[nodiscard]] std::expected<void, DriverError> stop() const;

        timer::PhysicalTimer timer;
        gpio::Device scl;
        gpio::Device sda;
        std::uint8_t address;
    };
}

#endif //WALLET_FIRMWARE_I2C_H
