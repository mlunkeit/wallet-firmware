#ifndef WALLET_FIRMWARE_DISPLAY_H
#define WALLET_FIRMWARE_DISPLAY_H

#include "driver/i2c.h"

namespace wallet::driver::display
{
    class SSD1306
    {
    public:
        explicit SSD1306(i2c::Device i2cDev);

        std::expected<void, DriverError> initialize();
        std::expected<void, DriverError> write_page(std::uint8_t page, const std::uint8_t data[128]);

    private:
        i2c::Device i2cDev;
    };
}

#endif //WALLET_FIRMWARE_DISPLAY_H
