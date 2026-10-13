// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell
import Quickshell.Wayland

import "../modules"

PanelWindow {
    WlrLayershell.namespace: ShellProperties.namespace

    anchors {
        right: true
        left: true
        top: true
    }

    margins {
        right: 8
        left: 8
        top: 8
    }

    color: "transparent"
    implicitHeight: 24
}
