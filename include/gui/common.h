//
// Created by M Lunkeit on 07.10.26.
//

#ifndef WALLET_FIRMWARE_GUI_H
#define WALLET_FIRMWARE_GUI_H

#include <cstdint>

namespace wallet::gui
{
    enum class GUIError : std::uint8_t
    {
        DriverError = 0,
    };
}

#endif //WALLET_FIRMWARE_GUI_H
