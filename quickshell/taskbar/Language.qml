import Quickshell
import Quickshell.Io
import QtQuick

import ".."

Text {
    property string currentLayout: "en"

    text: currentLayout
    color: Config.colors.text

    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }

    font {
        family: fontMonaco.name
        pixelSize: 12
    }

    Process {
        id: languageProcess

        command: ["sh", "-c", "hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                switch (this.text) {
                case "English (US)\n":
                    currentLayout = "en"
                    break;
                case "Russian\n":
                    currentLayout = "ru"
                    break;
                }
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: languageProcess.running = true
    }
}
