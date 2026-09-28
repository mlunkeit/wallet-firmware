//
// Created by M Lunkeit on 28.09.26.
//

#ifndef WALLET_FIRMWARE_SERVICE_TIMER_H
#define WALLET_FIRMWARE_SERVICE_TIMER_H

#include "driver/timer.h"
#include "service/common.h"

namespace wallet::service::timer
{
    using TimerFunction = void (*)();

    class Timer
    {
    public:
        explicit Timer (driver::timer::PhysicalTimer& physical);

        std::expected<void, ServiceError> set_timeout(std::chrono::milliseconds duration, TimerFunction func);
        std::expected<std::uint8_t, ServiceError> set_interval(std::chrono::milliseconds duration, TimerFunction func);
        std::expected<void, ServiceError> unset_interval(std::uint8_t id);

    private:
        driver::timer::PhysicalTimer& physical;
    };
}

#endif //WALLET_FIRMWARE_SERVICE_TIMER_H
