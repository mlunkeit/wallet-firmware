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

    struct Task
    {
        std::chrono::milliseconds execute_at;
        // set to 0 if repeating should be disabled
        std::chrono::milliseconds period;

        TimerFunction func;

        std::uint8_t id;
    };

    class Timer
    {
    public:
        explicit Timer (driver::timer::PhysicalTimer physical);

        std::expected<void, ServiceError> set_timeout(std::chrono::milliseconds duration, TimerFunction func);
        std::expected<std::uint8_t, ServiceError> set_interval(std::chrono::milliseconds duration, TimerFunction func);
        std::expected<void, ServiceError> unset_interval(std::uint8_t id);

        std::uint32_t now();

        void on_interrupt();

    private:
        driver::timer::PhysicalTimer physical;
        std::array<Task, 16> tasks;
        std::uint32_t time = 0;
    };
}

#endif //WALLET_FIRMWARE_SERVICE_TIMER_H
