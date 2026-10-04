#include "driver/gpio.h"
#include "driver/common.h"

#include <stm32f4xx.h>
#include <expected>

using namespace wallet::driver;

std::expected<GPIO_TypeDef*, DriverError> gpio_typedef(const gpio::Port port)
{
    GPIO_TypeDef *gpio;

    switch (port)
    {
        case gpio::Port::A:
            gpio = GPIOA;
            break;
        case gpio::Port::B:
            gpio = GPIOB;
            break;
        case gpio::Port::C:
            gpio = GPIOC;
            break;
        default:
            return std::unexpected(DriverError::IllegalArguments);
    }

    return gpio;
}

std::expected<void, DriverError> gpio::require(const Port port)
{
    switch (port)
    {
        case Port::A:
            RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
            break;
        case Port::B:
            RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;
            break;
        case Port::C:
            RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
            break;
        default:
            return std::unexpected(DriverError::IllegalArguments);
    }

    return {};
}

std::expected<gpio::Device, DriverError> gpio::Device::open(Mode mode, Type type, Speed speed, PullType pullType, const Pin pin)
{
    return gpio_typedef(pin.port).and_then([mode, type, speed, pullType, pin](GPIO_TypeDef *gpio) -> std::expected<Device, DriverError>
    {
        if (pin.num >= 16)
            return std::unexpected(DriverError::IllegalArguments);

        return Device(
            static_cast<std::uint8_t>(mode),
            static_cast<std::uint8_t>(type),
            static_cast<std::uint8_t>(speed),
            static_cast<std::uint8_t>(pullType),
            pin.num,
            gpio
        );
    });
}

gpio::Device::Device(
    const std::uint8_t mode,
    const std::uint8_t type,
    const std::uint8_t speed,
    const std::uint8_t pupd,
    const std::uint8_t pin,
    GPIO_TypeDef *gpio) : gpio(gpio), pin(pin)
{
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

    this->gpio->BSRR = 1u << (this->pin + (out ? 0 : 16));
    return {};
}

std::expected<bool, DriverError> gpio::Device::get() const
{
    if (!this->gpio)
        return std::unexpected(DriverError::IllegalState);

    return get_register_32(&this->gpio->IDR, this->pin, 1) ? true : false;
}