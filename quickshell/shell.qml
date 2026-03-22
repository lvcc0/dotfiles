import Quickshell
import QtQuick

import "taskbar" as Taskbar

// todo: wallpaper switcher
// todo: options menu
// todo: system resources gui
// todo: super+tab switcher

Scope {
    id: root

    FontLoader {
        id: fontMonaco
        source: "fonts/Monaco.ttf"
    }

    Taskbar.Taskbar {}
}