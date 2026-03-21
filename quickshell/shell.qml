import Quickshell
import QtQuick

import "taskbar" as Taskbar

Scope {
    id: root

    FontLoader {
        id: fontMonaco
        source: "fonts/Monaco.ttf"
    }

    Taskbar.Taskbar {}
}