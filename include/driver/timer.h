#ifndef WALLET_FIRMWARE_DRIVER_TIMER_H
#define WALLET_FIRMWARE_DRIVER_TIMER_H

#include <chrono>
#include <expected>

#include <stm32f4xx.h>

#include "driver/common.h"

#define CPU_CLOCK_SPEED 120'000'000

namespace wallet::driver::timer
{
    using CallbackFunc = void (*)();

    enum Hardware : std::uint8_t
    {
        Tim2 = 0,
        Tim3 = 1,
        Tim4 = 2,
        Tim5 = 3
    };

    std::expected<void, DriverError> require(Hardware hardware);

    class PhysicalTimer
    {
    public:
        static std::expected<PhysicalTimer, DriverError> open(Hardware hardware);
        ~PhysicalTimer();

        PhysicalTimer(PhysicalTimer&) = delete;
        PhysicalTimer& operator=(PhysicalTimer&) = delete;

        PhysicalTimer(PhysicalTimer&&) = default;
        PhysicalTimer& operator=(PhysicalTimer&&) = default;

        std::expected<void, DriverError> handle(void (*func) ()) const;
        std::expected<void, DriverError> interval(std::chrono::nanoseconds duration) const;
        std::expected<void, DriverError> repeat(bool repeat) const;
        std::expected<void, DriverError> start() const;
        std::expected<void, DriverError> stop() const;

    private:
        explicit PhysicalTimer(TIM_TypeDef *timer, std::uint8_t bits, volatile CallbackFunc *handler);
        TIM_TypeDef *timer;
        std::uint8_t bits;

        void (*volatile*handler)();
    };
}

#endif //WALLET_FIRMWARE_DRIVER_TIMER_H
