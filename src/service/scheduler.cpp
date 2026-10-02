#include "service/scheduler.h"

#include <algorithm>

using namespace wallet::service;

static bool cmptask(const scheduler::Task& t1, const scheduler::Task& t2)
{
    return t1.execute_at < t2.execute_at;
}

scheduler::Scheduler::Scheduler(driver::timer::PhysicalTimer physical)
    :   physical(std::move(physical)),
        callback {.func = [](void *ctx) -> void {
            static_cast<Scheduler*>(ctx)->on_interrupt();
        }, .ctx = this},
        current_tasks(0)
{
    auto _ = physical.interval(std::chrono::milliseconds(1));
    _ = physical.repeat(true);
    _ = physical.handle(callback);
    _ = physical.start();
}

scheduler::Scheduler::Scheduler(Scheduler&& old) noexcept
    :   physical(std::move(old.physical)),
        callback { .func = old.callback.func, .ctx = this },
        tasks(old.tasks),
        current_tasks(old.current_tasks),
        locked(old.locked)
{
    auto _ = this->physical.handle(this->callback);
}

scheduler::Scheduler::~Scheduler()
{
    auto _ = this->physical.stop();
}

void scheduler::Scheduler::on_interrupt()
{
    this->time++;

    const auto it = std::find_if(
        this->tasks.begin(),
        this->tasks.begin() + this->current_tasks,
        [this](const Task& task) -> bool { return task.execute_at.count() > this->time; }
    );

    std::uint16_t tasks_due = std::distance(this->tasks.begin(), it);

    if (tasks_due == 0) return;

    this->locked = true;

    std::uint16_t cancel = 0;

    for (std::uint16_t i = 0; i < tasks_due; i++)
    {
        Task& current = this->tasks[i];
        if (current.func->func != nullptr)
        {
            current.func->func(current.func->ctx);
        }

        if (current.period.count() > 0)
        {
            current.execute_at += current.period;
        }
        else
        {
            current.execute_at = std::chrono::milliseconds::max();
            cancel++;
        }
    }

    this->locked = false;

    std::sort(
        this->tasks.begin(),
        this->tasks.begin() + tasks_due,
        cmptask
    );

    for (; tasks_due > 0; tasks_due--)
    {
        const auto pos = std::lower_bound(
            this->tasks.begin() + tasks_due,
            this->tasks.begin() + this->current_tasks,
            this->tasks[tasks_due - 1],
            cmptask
        );

        std::rotate(
            this->tasks.begin() + tasks_due - 1,
            this->tasks.begin() + tasks_due,
            pos
        );
    }

    this->current_tasks -= cancel;
}

std::expected<void, ServiceError> scheduler::Scheduler::insert_task(const Task& task)
{
    if (this->locked)
        return std::unexpected(ServiceError::IllegalState);

    if (this->current_tasks == MAX_TASKS)
        return std::unexpected(ServiceError::QueueFull);

    this->tasks[this->current_tasks] = task;

    const auto pos = std::lower_bound(
        this->tasks.begin(),
        this->tasks.begin() + this->current_tasks,
        task,
        cmptask
    );

    std::rotate(pos,
        this->tasks.begin() + this->current_tasks,
        this->tasks.begin() + this->current_tasks + 1);

    this->current_tasks++;

    return {};
}

std::expected<void, ServiceError> scheduler::Scheduler::set_interval(const std::chrono::milliseconds duration, const ScheduledFunction& func)
{
    const Task task {
        .execute_at = now() + duration,
        .period = duration,
        .func = &func
    };

    return insert_task(task);
}

std::expected<void, ServiceError> scheduler::Scheduler::set_timeout(const std::chrono::milliseconds duration, const ScheduledFunction& func)
{
    const Task task {
        .execute_at = now() + duration,
        .period = std::chrono::milliseconds(0),
        .func = &func
    };

    return insert_task(task);
}

std::chrono::milliseconds scheduler::Scheduler::now() const
{
    return std::chrono::milliseconds(this->time);
}