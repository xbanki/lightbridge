// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property alias value: clock.date

    SystemClock {
        precision: SystemClock.Seconds
        id: clock
    }
}
