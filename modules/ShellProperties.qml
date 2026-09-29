// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias primaryMonitorConnector: properties.primaryMonitorConnector

    property bool ready: false

    function isPrimaryMonitor(monitor) {
        if (!monitor) return

        let found = false
        for (let i = 0; i < Quickshell.screens.length; i++) {
            const screen = Quickshell.screens[i]
            if (this.primaryMonitorConnector.length == 0) {
                this.primaryMonitorConnector = screen.name
                found = true
                break
            }

            if (this.primaryMonitorConnector == screen.name) {
                found = true
                break
            }
        }

        if (!found) this.primaryMonitorConnector = Quickshell.screens[0].name

        return monitor.name == this.primaryMonitorConnector
    }

    Process {
        id: process
        function run(command) {
            this.command = command
            this.running = true
        }
    }

    FileView {
        id: file
        watchChanges: true
        path: Quickshell.env("LIGHTBRIDGE_SHELL_CONFIG") ?? (Quickshell.env("XDG_CONFIG_HOME")
            ?? Quickshell.env("HOME") + "/.config") + "/lightbridge/config.json"

        onAdapterUpdated: writeAdapter()
        onFileChanged: this.reload()
        onLoaded: root.ready = true
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
