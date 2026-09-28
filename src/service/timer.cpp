#include "service/timer.h"

using namespace wallet::service;

timer::Timer::Timer(driver::timer::PhysicalTimer& physical) : physical(physical) {}
