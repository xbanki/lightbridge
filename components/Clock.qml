// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../modules"
import "../widgets"

Squircle {
    id: root

    implicitWidth: label.implicitWidth + 12
    color: "transparent"
    implicitHeight: 24
    rounding: 4

    Text {
        text: Qt.formatDateTime(DateTime.value, "hh:mm AP")
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        color: ShellTheme.colors.surface._200
        id: label
    }
}
