#include "driver/gpio.h"
#include "driver/common.h"

#include <stm32f4xx.h>
#include <expected>

using namespace wallet::driver;

static void setregv(volatile std::uint32_t *reg, const std::uint8_t val, const std::uint8_t idx, const std::uint8_t wdt)
{
    const std::uint32_t mask = ((1 << wdt) - 1) << (idx * wdt);
    *reg &= ~mask;
    *reg |= val << (idx * wdt);
}

static std::uint8_t getregv(const volatile std::uint32_t *reg, const std::uint8_t idx, const std::uint8_t wdt)
{
    const std::uint32_t mask = ((1 << wdt) - 1) << (idx * wdt);
    return (*reg & mask) >> (idx * wdt);
}

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
    GPIO_TypeDef *gpio)
{
    this->gpio = gpio;
    setregv(&gpio->MODER, mode, pin, 2);
    setregv(&gpio->OTYPER, type, pin, 1);
    setregv(&gpio->OSPEEDR, speed, pin, 2);
    setregv(&gpio->PUPDR, pupd, pin, 2);
}

std::expected<void, DriverError> gpio::Device::set(const bool out) const
{
    if (!this->gpio)
        return std::unexpected(DriverError::IllegalState);

    setregv(&this->gpio->ODR, out ? 1 : 0, this->pin, 1);
    return {};
}

std::expected<bool, DriverError> gpio::Device::get() const
{
    if (!this->gpio)
        return std::unexpected(DriverError::IllegalState);

    return getregv(&this->gpio->IDR, this->pin, 1) ? true : false;
}