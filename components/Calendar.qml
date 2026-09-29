// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../modules"

Rectangle {
    implicitWidth: label.implicitWidth + 12
    color: "transparent"
    implicitHeight: 24
    radius: 4
    id: root

    Text {
        text: Qt.formatDateTime(DateTime.value, "dddd, d. MMMM")
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        color: "white"
        id: label
    }
}
