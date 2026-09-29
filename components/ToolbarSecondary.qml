// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell
import QtQuick.Layouts

import "../widgets"

ToolbarSkeleton {
    id: root

    mask: Region {
        Region { item: clock }
    }

    Item {
        anchors.fill: parent
        id: panel

        RowLayout {
            anchors.verticalCenter: panel.verticalCenter
            anchors.right: panel.right
            spacing: 4

            Clock { id: clock }
        }
    }
}
