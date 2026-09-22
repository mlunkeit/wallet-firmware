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
}

#endif //WALLET_FIRMWARE_DRIVER_H
