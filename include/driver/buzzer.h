//
// Created by M Lunkeit on 23.09.26.
//

#ifndef WALLET_FIRMWARE_BUZZER_H
#define WALLET_FIRMWARE_BUZZER_H

#include "driver/gpio.h"

namespace wallet::driver::buzzer
{
    class Passive
    {
    public:
        Passive(const Passive&) = delete;
        Passive& operator=(const Passive&) = delete;

        Passive(Passive&&) = default;
        Passive& operator=(Passive&&) = default;

        [[nodiscard]] static std::expected<Passive, DriverError> open(gpio::Pin pin);

        [[nodiscard]] std::expected<void, DriverError> play(std::uint32_t frequency, std::uint32_t milliseconds) const;

    private:
        explicit Passive(gpio::Device dev);
        gpio::Device dev;
    };
}

#endif //WALLET_FIRMWARE_BUZZER_H
