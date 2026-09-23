#include "driver/gpio.h"
#include "driver/common.h"

#include <stm32f4xx.h>
#include <expected>

using namespace wallet::driver;

std::expected<gpio::Device, DriverError> gpio::Device::open(Mode mode, Type type, Speed speed, PullType pullType, const Pin pin)
{
    GPIO_TypeDef *gpio;

    switch (pin.port)
    {
        case Port::A:
            gpio = GPIOA;
            break;
        case Port::B:
            gpio = GPIOB;
            break;
        case Port::C:
            gpio = GPIOC;
            break;
        default:
            return std::unexpected(DriverError::IllegalArguments);
    }

    if (pin.num >= 16)
        return std::unexpected(DriverError::IllegalArguments);

    return Device(
        static_cast<std::uint8_t>(mode),
        static_cast<std::uint8_t>(type),
        static_cast<std::uint8_t>(speed),
        static_cast<std::uint8_t>(pullType),
        static_cast<std::uint8_t>(pin.port),
        gpio
    );
}

gpio::Device::Device(
    const std::uint8_t mode,
    const std::uint8_t type,
    const std::uint8_t speed,
    const std::uint8_t pupd,
    const std::uint8_t pin,
    GPIO_TypeDef *gpio) : gpio(gpio), pin(pin)
{
    if (mode == 0b00)
        allowInput = true;
    if (mode == 0b01)
        allowOutput = true;

    set_register_32(&gpio->MODER, mode, pin, 2);
    set_register_32(&gpio->OTYPER, type, pin, 1);
    set_register_32(&gpio->OSPEEDR, speed, pin, 2);
    set_register_32(&gpio->PUPDR, pupd, pin, 2);
}

gpio::Device::~Device() = default;

std::expected<void, DriverError> gpio::Device::set(const bool out) const
{
    if (!this->gpio)
        return std::unexpected(DriverError::IllegalState);

    if (!this->allowOutput)
        return std::unexpected(DriverError::IllegalOperation);

    this->gpio->BSRR = 1u << (this->pin + (out ? 0 : 16));
    return {};
}

std::expected<bool, DriverError> gpio::Device::get() const
{
    if (!this->gpio)
        return std::unexpected(DriverError::IllegalState);

    if (!this->allowInput)
        return std::unexpected(DriverError::IllegalOperation);

    return get_register_32(&this->gpio->IDR, this->pin, 1) ? true : false;
}