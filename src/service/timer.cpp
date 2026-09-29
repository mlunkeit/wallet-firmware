#include "service/timer.h"

using namespace wallet::service;

template <timer::Timer &TimerInstance>
static void hardware_interrupt()
{
    TimerInstance.on_interrupt();
}

timer::Timer::Timer(driver::timer::PhysicalTimer physical) : physical(std::move(physical)), tasks()
{
    //auto _ = physical.interval(std::chrono::milliseconds(1));
    //_ = physical.repeat(true);
    //_ = physical.handle();
}

std::expected<uint8_t, ServiceError> timer::Timer::set_interval(std::chrono::milliseconds duration, TimerFunction func)
{

}