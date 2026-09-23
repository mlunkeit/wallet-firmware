//
// Created by M Lunkeit on 22.09.26.
//

#ifndef WALLET_FIRMWARE_DRIVER_H
#define WALLET_FIRMWARE_DRIVER_H

#include <cstdint>

namespace wallet::driver
{
    enum class DriverError : std::uint8_t
    {
        IllegalArguments = 0x1,
        IllegalOperation = 0x2,
        IllegalState = 0x3
    };

    void sleep(std::uint32_t nanoseconds);
    void set_register_32(volatile std::uint32_t *addr, std::uint32_t val, std::uint8_t index, std::uint8_t bits);
    std::uint32_t get_register_32(const volatile std::uint32_t *addr, std::uint8_t index, std::uint8_t bits);
}

#endif //WALLET_FIRMWARE_DRIVER_H
