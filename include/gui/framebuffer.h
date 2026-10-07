#ifndef WALLET_FIRMWARE_FRAMEBUFFER_H
#define WALLET_FIRMWARE_FRAMEBUFFER_H

#include <array>

#include "driver/display.h"
#include "gui/common.h"

#define FRAMEBUFFER_ROWS        64
#define FRAMEBUFFER_COLUMNS     128
#define FRAMEBUFFER_SEGMENTS    8

namespace wallet::gui
{
    class Framebuffer
    {
    public:
        explicit Framebuffer(driver::display::SSD1306 display);

        void clear();
        void set_pixel(uint8_t x, uint8_t y, bool value);
        std::expected<void, GUIError> flush();

    private:
        driver::display::SSD1306 display;
        std::array<std::uint8_t, 1024> buffer {};
        std::uint8_t dirty;
    };
}

#endif //WALLET_FIRMWARE_FRAMEBUFFER_H
