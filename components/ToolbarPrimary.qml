// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Layouts
import Quickshell

import "../widgets"

ToolbarSkeleton {
    id: root

    mask: Region {
        Region { item: clock }
        Region { item: calendar }
    }

    Item {
        anchors.fill: parent
        id: panel

        RowLayout {
            anchors.verticalCenter: panel.verticalCenter
            anchors.right: panel.right
            spacing: 4

            Calendar { id: calendar }
            Clock { id: clock }
        }
    }
}
