//
// Created by M Lunkeit on 28.09.26.
//

#ifndef WALLET_FIRMWARE_SCHEDULER_H
#define WALLET_FIRMWARE_SCHEDULER_H

#include "driver/timer.h"
#include "service/common.h"

#define MAX_TASKS 16

namespace wallet::service::scheduler
{
    struct ScheduledFunction
    {
        void (*func)(void*);
        void *ctx;
    };

    struct Task
    {
        std::chrono::milliseconds execute_at {0};
        // set to 0 if repeating should be disabled
        std::chrono::milliseconds period {0};

        const ScheduledFunction *func {nullptr};
    };

    class Scheduler
    {
    public:
        explicit Scheduler (driver::timer::PhysicalTimer physical);
        explicit Scheduler (Scheduler&&) noexcept;
        ~Scheduler();

        Scheduler (const Scheduler&) = delete;
        Scheduler& operator= (const Scheduler&) = delete;

        std::expected<void, ServiceError> set_timeout(std::chrono::milliseconds duration, const ScheduledFunction& func);
        std::expected<void, ServiceError> set_interval(std::chrono::milliseconds duration, const ScheduledFunction& func);

        [[nodiscard]] std::chrono::milliseconds now() const;

    private:
        driver::timer::PhysicalTimer physical;
        driver::timer::CallbackFunc callback;
        std::array<Task, MAX_TASKS> tasks;
        std::uint32_t time = 0;
        std::uint16_t current_tasks;
        bool locked = false;
        void on_interrupt();
        std::expected<void, ServiceError> insert_task(const Task &task);
    };
}

#endif //WALLET_FIRMWARE_SCHEDULER_H
