//
// Created by M Lunkeit on 23.09.26.
//

#include "driver/common.h"

using namespace wallet::driver;

void wallet::driver::sleep(const std::uint32_t nanoseconds)
{
    std::uint32_t cycles = nanoseconds / 25;
    while (cycles--)
    {
        asm volatile ("nop");
    }
}

void wallet::driver::set_register_32(volatile std::uint32_t *addr, const std::uint32_t val, const std::uint8_t index, const std::uint8_t bits)
{
    const std::uint32_t mask = ((1u << bits) - 1) << (index * bits);
    *addr &= ~mask;
    *addr |= val << (index * bits);
}

std::uint32_t wallet::driver::get_register_32(const volatile std::uint32_t *addr, const std::uint8_t index, const std::uint8_t bits)
{
    const std::uint32_t mask = ((1u << bits) - 1) << (index * bits);
    return (*addr & mask) >> (index * bits);
}