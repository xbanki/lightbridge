// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../widgets"

Item {
    id: root

    required property Component button
    required property Component panel

    property bool _open: false
    property real _padding: 8

    implicitHeight: buttonloader.item.height ?? 24
    implicitWidth: buttonloader.item.width ?? 24

    on_OpenChanged: console.log("Open state:", _open)

    MouseArea {
        anchors.fill: root
        onClicked: root._open = !root._open
    }

    Loader {
        id: buttonloader

        sourceComponent: button
    }

    PopupWindow {
        implicitHeight: panelpadding.height + panelloader.height + root._padding + 4
        implicitWidth: panelloader.width + 8
        color: "transparent"
        anchor.rect.x: -4
        anchor.item: root
        visible: false

        HoverIntent {
            id: hoverintent

            origin: panelpadding
            target: panelwrapper
            tolerance: -1
            padding: 1
            hovered: true
            debug: true
        }

        Item {
            id: panelpadding

            implicitHeight: buttonloader.item.height ?? 24
            implicitWidth: buttonloader.item.widht ?? 24
            x: 2
        }

        Item {
            id: panelwrapper

            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: panelloader.item.height ?? 0
            implicitWidth: panelloader.item.width ?? 0
            y: panelpadding.height + root._padding

            Loader {
                id: panelloader

                sourceComponent: panel
            }
        }
    }
}
