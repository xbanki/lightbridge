// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../widgets"

Rectangle {
    id: root

    color: "transparent"
    height: 24
    width: 24
    radius: 4

    Icon {
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        color: "white"
        icon: "menu"
    }
}
