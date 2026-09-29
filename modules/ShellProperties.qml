// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias primaryMonitorConnector: properties.primaryMonitorConnector

    Process {
        id: process
        function run(command) {
            this.command = command
            this.running = true
        }
    }

    FileView {
        watchChanges: true
        path: Quickshell.env("LIGHTBRIDGE_SHELL_CONFIG") ?? (Quickshell.env("XDG_CONFIG_HOME")
            ?? Quickshell.env("HOME") + "/.config") + "/lightbridge/config.json"

        onFileChanged: this.reload()
        onLoadFailed: error => {
            if (error === FileViewError.FileNotFound) {
                const path = (Quickshell.env("XDG_CONFIG_HOME") ?? Quickshell.env("HOME")
                    + "/.config") + "/lightbridge";

                process.run(["mkdir", "-p", path])
                this.writeAdapter();
            }
        }

        adapter: JsonAdapter {
            id: properties

            property string primaryMonitorConnector: ""
        }
    }
}
