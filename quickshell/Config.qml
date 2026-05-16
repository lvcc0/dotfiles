pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

// todo: more themes
// todo: theme changer gui
// todo: some more settings (+gui)

Singleton {
    id: root

    property string currentTheme: "default"
    property var colors: themes[ themes[currentTheme] == null ? "default" : currentTheme ]

    property var themes: {
        "default": {
            "base": "#d8d8d8",
            "shadow": "#9b9b9b",
            "highlight": "#efefef",
            "urgent": "#ff723e",
            "accent": "#207874",
            "text": "#000000",
            "outline": "#000000"
        }
    }
}