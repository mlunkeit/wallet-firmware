#ifndef WALLET_FIRMWARE_I2C_H
#define WALLET_FIRMWARE_I2C_H

#include "driver/common.h"
#include "driver/gpio.h"

namespace wallet::driver::i2c
{
    enum class Port : std::uint8_t
    {
        i2c1 = 1,
        i2c2 = 2
    };

    std::expected<void, DriverError> require(Port port);

    class Device
    {
    public:
        Device(Device&) = delete;
        Device& operator=(Device&) = delete;

        Device(Device&&) = default;
        Device& operator=(Device&&) = default;

        static std::expected<Device, DriverError> open(Port port, std::uint8_t address);

        std::expected<void, DriverError> transmit(const std::uint8_t *data, std::size_t size);
        //std::expected<std::size_t, DriverError> receive(std::uint8_t *data, std::size_t size);

    private:
        Device(I2C_TypeDef *i2c, std::uint8_t address);
        I2C_TypeDef *i2c;
        std::uint8_t address;
    };
}

#endif //WALLET_FIRMWARE_I2C_H
