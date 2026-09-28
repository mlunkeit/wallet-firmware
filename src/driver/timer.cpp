#include "driver/timer.h"

#include "stm32f4xx.h"

using namespace wallet::driver;

static volatile timer::CallbackFunc tim2_callback;
static volatile timer::CallbackFunc tim3_callback;
static volatile timer::CallbackFunc tim4_callback;
static volatile timer::CallbackFunc tim5_callback;

static void handle_update_interrupt(TIM_TypeDef *timer, const timer::CallbackFunc callback)
{
    // update interrupt flag has to be set in status register
    if (!(timer->SR & TIM_SR_UIF))
        return;

    // unset update interrupt flag
    timer->SR &= ~TIM_SR_UIF;

    if (callback)
        callback();
}

extern "C" void TIM2_IRQHandler()
{
    handle_update_interrupt(TIM2, tim2_callback);
}

extern "C" void TIM3_IRQHandler()
{
    handle_update_interrupt(TIM3, tim3_callback);
}

extern "C" void TIM4_IRQHandler()
{
    handle_update_interrupt(TIM4, tim4_callback);
}

extern "C" void TIM5_IRQHandler()
{
    handle_update_interrupt(TIM5, tim5_callback);
}

std::expected<void, DriverError> timer::require(const Hardware hardware)
{
    switch (hardware)
    {
        case Tim2:
            NVIC_EnableIRQ(TIM2_IRQn);
            RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
            break;
        case Tim3:
            NVIC_EnableIRQ(TIM3_IRQn);
            RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;
            break;
        case Tim4:
            NVIC_EnableIRQ(TIM4_IRQn);
            RCC->APB1ENR |= RCC_APB1ENR_TIM4EN;
            break;
        case Tim5:
            NVIC_EnableIRQ(TIM5_IRQn);
            RCC->APB1ENR |= RCC_APB1ENR_TIM5EN;
            break;
        default: return std::unexpected(DriverError::IllegalArguments);
    }

    return {};
}

std::expected<timer::PhysicalTimer, DriverError> timer::PhysicalTimer::open(const Hardware hardware)
{
    TIM_TypeDef *timer;
    volatile CallbackFunc *callback;
    std::uint8_t bits;

    switch (hardware)
    {
        case Tim2:
            timer = TIM2;
            callback = &tim2_callback;
            bits = 32;
            break;
        case Tim3:
            timer = TIM3;
            callback = &tim3_callback;
            bits = 16;
            break;
        case Tim4:
            timer = TIM4;
            callback = &tim4_callback;
            bits = 16;
            break;
        case Tim5:
            timer = TIM5;
            callback = &tim5_callback;
            bits = 32;
            break;
        default:
            return std::unexpected(DriverError::IllegalArguments);
    }

    if (*callback != nullptr)
    {
        return std::unexpected(DriverError::ResourceOccupied);
    }

    return PhysicalTimer(timer, bits, callback);
}

timer::PhysicalTimer::PhysicalTimer(TIM_TypeDef *timer, const std::uint8_t bits, volatile CallbackFunc *handler) : bits(bits), handler(handler)
{
    this->timer = timer;
    timer->CR1 &= ~TIM_CR1_DIR;
    timer->DIER |= TIM_DIER_UIE;
}

timer::PhysicalTimer::~PhysicalTimer()
{
    if (handler != nullptr)
    {
        *handler = nullptr;
    }
}

std::expected<void, DriverError> timer::PhysicalTimer::handle(const CallbackFunc func) const
{
    if (handler == nullptr)
    {
        return std::unexpected(DriverError::IllegalState);
    }

    *handler = func;
    return {};
}

std::expected<void, DriverError> timer::PhysicalTimer::interval(const std::chrono::nanoseconds duration) const
{
    constexpr std::uint64_t timer_freq = CPU_CLOCK_SPEED >> 1;
    const std::uint64_t ticks = duration.count() * timer_freq / 1'000'000'000;

    std::uint64_t arr = ticks; // 10 ns per cycle at 100MHz
    std::uint64_t psc = 0;

    const std::uint64_t mask = (static_cast<std::uint64_t>(1) << this->bits) - 1;

    while (arr & ~mask) // overflow detected
    {
        psc++;
        arr *= psc;
        arr /= psc + 1;
    }

    if (psc > 0xFFFF)
    {
        return std::unexpected(DriverError::IntegerOverflow);
    }

    this->timer->PSC = psc;
    this->timer->ARR = arr;

    return {};
}

std::expected<void, DriverError> timer::PhysicalTimer::repeat(const bool repeat) const
{
    this->timer->CR1 &= ~TIM_CR1_OPM;
    this->timer->CR1 |= repeat ? 0 : TIM_CR1_OPM;
    return {};
}

std::expected<void, DriverError> timer::PhysicalTimer::start() const
{
    this->timer->CR1 |= TIM_CR1_CEN;
    return {};
}

std::expected<void, DriverError> timer::PhysicalTimer::stop() const
{
    this->timer->CR1 &= ~TIM_CR1_CEN;
    return {};
}

