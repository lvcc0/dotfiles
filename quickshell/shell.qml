import QtQuick
import Quickshell

import QtQuick.Layouts
import Quickshell.Wayland

import "taskbar" as Taskbar

// todo: wallpaper switcher
// todo: options menu
// todo: system resources gui
// todo: super+tab switcher
// todo: calendar widget

ShellRoot {
    id: root

    FontLoader {
        id: fontMonaco
        source: "fonts/Monaco.ttf"
    }

    Taskbar.Taskbar {}
}

