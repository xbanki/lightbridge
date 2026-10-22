// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../modules"
import "../widgets"

ExpandablePanel {
    id: root

    readonly property color colorPanel: Util.opaqueColor(ShellTheme.colors.surface._950, 0.72)

    button: Squircle {
        id: button

        implicitHeight: 24
        implicitWidth: 24
        rounding: 4

        color: hover.hovered ? root.colorPanel : "transparent"

        HoverHandler { id: hover }
        Behavior on color {
            ColorAnimation {
                easing: Easing.InOutCubic
                duration: 120
            }
        }

        Icon {
            anchors.horizontalCenter: button.horizontalCenter
            anchors.verticalCenter: button.verticalCenter
            color: ShellTheme.colors.surface._200
            icon: "menu"
        }
    }

    panel: Squircle {
        implicitHeight: 64
        implicitWidth: 256
        rounding: 4
    }
}
