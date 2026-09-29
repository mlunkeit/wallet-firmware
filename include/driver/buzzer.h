//
// Created by M Lunkeit on 23.09.26.
//

#ifndef WALLET_FIRMWARE_BUZZER_H
#define WALLET_FIRMWARE_BUZZER_H

#include "driver/gpio.h"
#include "driver/timer.h"

namespace wallet::driver::buzzer
{
    class Passive
    {
    public:
        ~Passive();

        Passive(const Passive&) = delete;
        Passive& operator=(const Passive&) = delete;

        explicit Passive(Passive&&) noexcept;
        Passive& operator=(Passive&&) = delete;

        [[nodiscard]] static std::expected<Passive, DriverError> open(const timer::PhysicalTimer& timer, gpio::Pin pin);

        // set the frequency of the note to be played
        [[nodiscard]] std::expected<void, DriverError> frequency(std::uint32_t frequency) const;

        // start playing the sound with the set frequency
        [[nodiscard]] std::expected<void, DriverError> start() const;

        // stop playing the current sound
        [[nodiscard]] std::expected<void, DriverError> stop() const;

    private:
        explicit Passive(const timer::PhysicalTimer& timer, gpio::Device dev);
        const timer::PhysicalTimer& timer;
        gpio::Device dev;
        bool state;
        timer::CallbackFunc callback;
        void toggle();
    };
}

#endif //WALLET_FIRMWARE_BUZZER_H
