//
// Created by M Lunkeit on 22.09.26.
//

#ifndef WALLET_FIRMWARE_GPIO_H
#define WALLET_FIRMWARE_GPIO_H

#include <cstdint>
#include <expected>
#include <variant>

#include <stm32f4xx.h>

#include "driver/common.h"

namespace wallet::driver::gpio
{
    enum class Mode : std::uint8_t
    {
        Input = 0b00,
        Output = 0b01,
        AlternateFunction = 0b10
    };

    enum class Type : std::uint8_t
    {
        PushPull = 0b0,
        OpenDrain = 0b1
    };

    enum class Speed : std::uint8_t
    {
        Low = 0b00,
        Medium = 0b01,
        High = 0b10,
        VeryHigh = 0b11
    };

    enum class PullType : std::uint8_t
    {
        None = 0b00,
        PullUp = 0b01,
        PullDown = 0b10
    };

    enum class Port : std::uint8_t
    {
        A = 0,
        B = 1,
        C = 2,
    };

    struct Pin
    {
        Port port;
        std::uint8_t num;
    };

    class Device
    {
    public:
        static std::expected<Device, DriverError> open(Mode mode, Type type, Speed speed, PullType pullType, Pin pin);
        ~Device();

        [[nodiscard]] std::expected<void, DriverError> set(bool out) const;
        [[nodiscard]] std::expected<bool, DriverError> get() const;

    private:
        Device(std::uint8_t mode, std::uint8_t type, std::uint8_t speed, std::uint8_t pupd, std::uint8_t pin, GPIO_TypeDef *gpio);

        GPIO_TypeDef *gpio;
        std::uint8_t pin;
    };
}

#endif //WALLET_FIRMWARE_GPIO_H
