// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import Quickshell
import QtQuick.Controls.impl

IconImage {
    required property string icon

    property real size: 18

    source: "file://" + Quickshell.shellDir + "/icons/" + icon + ".svg"
    height: size
    width: size
}
