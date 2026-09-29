// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import Quickshell

import "../modules"

Variants {
    // @NOTE(xbanki): This is the hack of all hacks. Due to fun race conditions introduced by the
    //                hierarchical model of Quickshell, JSON data *might* take longer to load off
    //                disk than it takes to instantiate the `screens` list. So, we have to have a
    //                dirty no-good flag to make sure we evaluate what the primary screen is
    //                *after* all shell props data has been fully loaded.
    model: ShellProperties.ready ? Quickshell.screens : []
    Scope {
        required property var modelData
        LazyLoader {
            active: ShellProperties.isPrimaryMonitor(modelData)
            ToolbarPrimary { screen: modelData }
        }

        LazyLoader {
            active: !ShellProperties.isPrimaryMonitor(modelData)
            ToolbarSecondary { screen: modelData }
        }
    }
}
