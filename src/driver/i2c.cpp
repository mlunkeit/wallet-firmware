#include "driver/i2c.h"
#include "driver/gpio.h"

#include <stm32f4xx.h>

using namespace wallet::driver;

std::expected<void, DriverError> i2c::require(const Port port)
{
    switch (port)
    {
        case Port::i2c1:
            // Enable GPIO B and I2C1
            RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;
            RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;

            // Enable alternate function for GPIO ports 6 and 7
            set_register_32(&GPIOB->MODER, 0b10, 6, 2);
            set_register_32(&GPIOB->MODER, 0b10, 7, 2);

            // Enable open drain
            set_register_32(&GPIOB->OTYPER, 0b1, 6, 1);
            set_register_32(&GPIOB->OTYPER, 0b1, 7, 1);

            // Enable pull up
            set_register_32(&GPIOB->PUPDR, 0b01, 6, 2);
            set_register_32(&GPIOB->PUPDR, 0b01, 7, 2);

            set_register_32(&GPIOB->AFR[0], 0b0100, 6, 4);
            set_register_32(&GPIOB->AFR[0], 0b0100, 7, 4);

            I2C1->CR1  &= ~I2C_CR1_PE;
            I2C1->CR2   = 30;
            I2C1->CCR   = 150;
            I2C1->TRISE = 31;
            I2C1->CR1  |= I2C_CR1_PE;

            break;
        case Port::i2c2:
            RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;
            RCC->APB1ENR |= RCC_APB1ENR_I2C2EN;

            // Enable alternate function for GPIO ports 8 and 9
            set_register_32(&GPIOB->MODER, 0b10, 8, 2);
            set_register_32(&GPIOB->MODER, 0b10, 9, 2);

            set_register_32(&GPIOB->OTYPER, 0b1, 8, 1);
            set_register_32(&GPIOB->OTYPER, 0b1, 9, 1);

            set_register_32(&GPIOB->PUPDR, 0b01, 8, 2);
            set_register_32(&GPIOB->PUPDR, 0b01, 9, 2);

            set_register_32(&GPIOB->AFR[1], 0b0100, 0, 4);
            set_register_32(&GPIOB->AFR[1], 0b0100, 1, 4);

            I2C2->CR1  &= ~I2C_CR1_PE;
            I2C2->CR2   = 30;
            I2C2->CCR   = 150;
            I2C2->TRISE = 31;
            I2C2->CR1  |= I2C_CR1_PE;

            break;
        default:
            return std::unexpected(DriverError::IllegalArguments);
    }

    return {};
}

std::expected<i2c::Device, DriverError> i2c::Device::open(const Port port, const std::uint8_t address)
{
    if (address > 0x7F)
        return std::unexpected(DriverError::IllegalArguments);

    I2C_TypeDef *i2c;

    switch (port)
    {
        case Port::i2c1:
            i2c = I2C1;
            break;
        case Port::i2c2:
            i2c = I2C2;
            break;
        default:
            return std::unexpected(DriverError::IllegalArguments);
    }

    return Device(i2c, address);
}

i2c::Device::Device(I2C_TypeDef *i2c, const std::uint8_t address) : i2c(i2c), address(address) {}

std::expected<void, DriverError> i2c::Device::transmit(const std::uint8_t *data, const std::size_t size)
{
    // Setting the START bit causes the interface to generate a Start condition and to switch to
    // controller mode (MSL bit set) when the BUSY bit is cleared
    this->i2c->CR1 |= I2C_CR1_START;

    // Once the Start condition is sent, the SB bit is set by hardware.
    while (!(this->i2c->SR1 & I2C_SR1_SB)) asm volatile ("nop");

    // Then the controller waits for a read of the SR1 register followed by
    // a write in the DR register with the target address.
    //
    // To enter Transmitter mode, a controller
    // sends the target address with LSB reset.
    this->i2c->DR = this->address << 1;

    // As soon as the address byte is sent,
    // the ADDR bit is set by hardware
    while (!(this->i2c->SR1 & I2C_SR1_ADDR)) asm volatile ("nop");

    // Then the controller waits for a read of the SR1 register
    // followed by a read of the SR2 register
    (void) this->i2c->SR1;
    (void) this->i2c->SR2;

    for (std::size_t i = 0; i < size; i++)
    {
        this->i2c->DR = data[i];
        // When the acknowledge pulse is received, the TxE bit is set by hardware
        while (!(this->i2c->SR1 & I2C_SR1_TXE)) asm volatile ("nop");
    }

    // If TxE is set and a data byte was not written in the DR register before the end of the last data transmission,
    // BTF is set and the interface waits until BTF is cleared by a write to I2C_DR, stretching SCL low.
    while (!(this->i2c->SR1 & I2C_SR1_BTF)) asm volatile ("nop");

    // After the last byte is written to the DR register,
    // the STOP bit is set by software to generate a stop condition
    this->i2c->CR1 |= I2C_CR1_STOP;

    return {};
}