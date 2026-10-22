// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

pragma Singleton

import Quickshell

Singleton {
    function opaqueColor(color, opacity) {
        return Qt.hsla(color.hslHue, color.hslSaturation, color.hslLightness, opacity)
    }
}
