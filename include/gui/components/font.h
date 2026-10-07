//
// Created by M Lunkeit on 07.10.26.
//

#ifndef WALLET_FIRMWARE_FONT_H
#define WALLET_FIRMWARE_FONT_H

#include "gui/framebuffer.h"

namespace wallet::gui::components
{
    class Font
    {
    public:
        static Font get_default();

        void draw_char(Framebuffer& fb, char c, std::uint8_t x, std::uint8_t y, std::uint8_t scale = 1) const;
        void draw_string(Framebuffer& fb, std::string_view str, std::uint8_t x, std::uint8_t y, std::uint8_t scale = 1) const;

    private:
        Font(std::uint8_t width, std::uint8_t height, const std::uint8_t *bitmap);
        std::uint8_t width;
        std::uint8_t height;
        std::uint8_t bytes_per_char;
        std::uint8_t bits_per_char;
        const std::uint8_t *bitmap;
    };
}

#endif //WALLET_FIRMWARE_FONT_H
