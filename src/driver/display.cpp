#include "driver/display.h"

using namespace wallet::driver;

static constexpr std::uint8_t i2c_init_sequence[] = {
    0x00, // Co = 0, D/C# = 0 -> Command Stream

    0xAE,       // 1. Display OFF
    0xD5, 0x80, // 2. Set Display Clock Divide Ratio / Oscillator Frequency (Default: 0x80)
    0xA8, 0x3F, // 3. Set Multiplex Ratio (1/64 Duty für 128x64)
    0xD3, 0x00, // 4. Set Display Offset (0x00)
    0x40,       // 5. Set Display Start Line (0x00)

    0x8D, 0x14, // 6. Charge Pump ENABLE

    0x20, 0x02, // 7. Set Memory Addressing Mode -> Page Addressing Mode
    0xA1,       // 8. Set Segment Re-map
    0xC8,       // 9. Set COM Output Scan Direction
    0xDA, 0x12, // 10. Set COM Pins Hardware Configuration
    0x81, 0xCF, // 11. Set Contrast Control
    0xD9, 0xF1, // 12. Set Pre-Charge Period
    0xDB, 0x40, // 13. Set VCOMH Deselect Level

    0xA4,       // 14. Display shows RAM data
    0xAF        // 15. Display Power ON
};

display::SSD1306::SSD1306(i2c::Device i2cDev) : i2cDev(std::move(i2cDev)) {}

std::expected<void, DriverError> display::SSD1306::initialize()
{
    auto stream = this->i2cDev.open_stream();
    if (!stream.has_value())
    {
        return std::unexpected(stream.error());
    }

    return stream->write_bytes(i2c_init_sequence, sizeof(i2c_init_sequence));
}

std::expected<void, DriverError> display::SSD1306::write_page(const std::uint8_t page, const std::uint8_t data[128])
{
    i2c::Stream stream = TRY_VAL(this->i2cDev.open_stream());

    const std::uint8_t i2c_cmd_sequence[] = {
        0x80, static_cast<std::uint8_t>(0xB0 | (page & 0x7F)),
        0x80, 0x02,
        0x80, 0x10
    };

    // next bytes are commands
    TRY_VOID(stream.write_bytes(i2c_cmd_sequence, sizeof(i2c_cmd_sequence)));

    // next bytes are data
    TRY_VOID(stream.write_byte(0x40));
    // write display content
    TRY_VOID(stream.write_bytes(data, 128));

    return {};
}