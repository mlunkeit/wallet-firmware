#include "service/timer.h"

#include <algorithm>

using namespace wallet::service;

timer::Timer::Timer(driver::timer::PhysicalTimer physical)
    :   physical(std::move(physical)),
        callback {.func = [](void *ctx) -> void {
            static_cast<Timer*>(ctx)->on_interrupt();
        }, .ctx = this},
        tasks(),
        current_tasks(0)
{
    auto _ = physical.interval(std::chrono::milliseconds(1));
    _ = physical.repeat(true);
    _ = physical.handle(callback);
}

timer::Timer::Timer(Timer&& old) noexcept
    :   physical(std::move(old.physical)),
        callback { .func = old.callback.func, .ctx = this },
        tasks(std::move(old.tasks)),
        current_tasks(old.current_tasks)
{}

void timer::Timer::on_interrupt()
{
    this->time++;

    std::uint32_t tasks_completed = 0;

    for (std::uint32_t i = 0; i < this->current_tasks; i++)
    {
        Task& task = this->tasks[i];
        if (task.execute_at.count() > this->time)
            break;

        if (task.func.func != nullptr)
            task.func.func(task.func.ctx);
        tasks_completed++;
    }

    if (tasks_completed == 0)
        return;

    // copying all completed tasks to an array to insert them
    // back to the main task array later.
    std::array<Task, 16> reschedule;
    std::copy_n(this->tasks.data(), tasks_completed, reschedule.data());

    // moving all tasks "tasks_completed" elements to the left
    // so that all completed tasks will be removed from the array
    std::move(this->tasks.data() + tasks_completed, this->tasks.data() + this->current_tasks, this->tasks.data());
    this->current_tasks -= tasks_completed;

    for (std::uint32_t i = 0; i < tasks_completed; i++)
    {
        this->insert_task(reschedule[i]);
    }
}

void timer::Timer::insert_task(Task task)
{
    for (std::uint32_t i = 0; i < this->current_tasks; i++)
    {
        Task& current = this->tasks[i];
        if (current.execute_at.count() < task.execute_at.count())
            continue;

    }
}

std::expected<void, ServiceError> timer::Timer::set_interval(std::chrono::milliseconds duration, TimerFunction func)
{

}