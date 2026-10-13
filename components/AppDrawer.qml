// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../modules"
import "../widgets"

Squircle {
    id: root

    color: "transparent"
    rounding: 4
    height: 24
    width: 28

    Icon {
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        color: ShellTheme.colorTextPrimary
        icon: "app-drawer"
    }
}
