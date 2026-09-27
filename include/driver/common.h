//
// Created by M Lunkeit on 22.09.26.
//

#ifndef WALLET_FIRMWARE_DRIVER_H
#define WALLET_FIRMWARE_DRIVER_H

#include <cstdint>
#include <chrono>

namespace wallet::driver
{
    enum class DriverError : std::uint8_t
    {
        IllegalArguments = 0x1,
        IllegalOperation = 0x2,
        IllegalState = 0x3
    };

    [[gnu::always_inline]] inline void sleep(const std::chrono::nanoseconds ns)
    {
        std::uint64_t cycles = static_cast<std::uint64_t>(ns.count()) / 485ULL;
        while (cycles--)
        {
            asm volatile ("nop");
        }
    }

    inline void set_register_32(volatile std::uint32_t *addr, const std::uint32_t val, const std::uint8_t index, const std::uint8_t bits)
    {
        const std::uint32_t mask = ((1u << bits) - 1) << (index * bits);
        *addr &= ~mask;
        *addr |= val << (index * bits);
    }

    inline std::uint32_t get_register_32(const volatile std::uint32_t *addr, const std::uint8_t index, const std::uint8_t bits)
    {
        const std::uint32_t mask = ((1u << bits) - 1) << (index * bits);
        return (*addr & mask) >> (index * bits);
    }
}

#endif //WALLET_FIRMWARE_DRIVER_H
