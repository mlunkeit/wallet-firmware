//
// Created by M Lunkeit on 28.09.26.
//

#ifndef WALLET_FIRMWARE_SERVICE_COMMON_H
#define WALLET_FIRMWARE_SERVICE_COMMON_H

#include <cstdint>

namespace wallet::service
{
    enum class ServiceError : std::uint8_t
    {
        DriverError = 0x1,
        QueueFull = 0x2,
        IllegalState = 0x3,
    };
}

#endif //WALLET_FIRMWARE_SERVICE_COMMON_H
