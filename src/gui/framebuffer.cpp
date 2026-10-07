#include "gui/framebuffer.h"

using namespace wallet::gui;

inline std::uint8_t set_dirty(const std::uint8_t old, const std::uint8_t segment, const bool dirty)
{
    const std::uint8_t mask = 1 << segment;

    if (dirty)
        return old | mask;

    return old & ~mask;
}

Framebuffer::Framebuffer(driver::display::SSD1306 display)
    :   display(std::move(display)),
        dirty(0xFF)
{
    auto _ = this->flush();
}

void Framebuffer::clear()
{
    for (std::size_t i = 0; i < FRAMEBUFFER_SEGMENTS * FRAMEBUFFER_COLUMNS; i++)
    {
        this->buffer[i] = 0;
    }
}

void Framebuffer::set_pixel(std::uint8_t x, std::uint8_t y, bool value)
{
    if (x >= FRAMEBUFFER_COLUMNS)
        return;
    if (y >= FRAMEBUFFER_ROWS)
        return;

    std::uint8_t byte_idx   = x;
    std::uint8_t bit_idx    = y & 0x7;
    std::uint8_t segment    = y >> 3;

    std::uint8_t mask = 1 << bit_idx;

    std::uint8_t *addr = this->buffer.data() + FRAMEBUFFER_COLUMNS * segment + byte_idx;

    if (value)
    {
        *addr |= mask;
    }
    else
    {
        *addr &= ~mask;
    }

    this->dirty = set_dirty(this->dirty, segment, true);
}

std::expected<void, GUIError> Framebuffer::flush()
{
    for (std::uint8_t i = 0; i < FRAMEBUFFER_SEGMENTS; i++)
    {
        const bool is_dirty = this->dirty & 0x1;
        this->dirty >>= 1;
        if (!is_dirty)
        {
            continue;
        }

        if (auto err = this->display.write_page(i, this->buffer.data() + FRAMEBUFFER_COLUMNS * i); !err.has_value())
        {
            return std::unexpected(GUIError::DriverError);
        }
    }

    return {};
}