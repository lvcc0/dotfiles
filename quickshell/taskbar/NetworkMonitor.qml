import Quickshell
import Quickshell.Io
import QtQuick

import ".."

// note: maybe i will replace this with appropriate qs.Networking code

Text {
    property real downSpeed: 0
    property var lastBytes: 0

    property bool running: true;

    text: downSpeed.toFixed(1) + "kb/s"
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
        id: networkProcess
        command: ["cat", "/proc/net/dev"]
        stdout: SplitParser {
            onRead: data => {
                let lines = data.split('\n')

                for (let line of lines) {
                    if (!line.includes("wlo1")) {
                        continue;
                    }

                    let parts = line.trim().split(/\s+/);
                    let curBytes = parseInt(parts[1]);

                    if (lastBytes > 0) {
                        downSpeed = (curBytes - lastBytes) / 1024;
                    }

                    lastBytes = curBytes;
                    break;
                }
            }
        }
    }

    Process {
        id: connectionProcess
        command: ["nmcli", "radio", "wifi"]
        stdout: SplitParser {
            onRead: data => {
                running = (data.trim() === "enabled");
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true

        onTriggered: {
            connectionProcess.running = true;
            networkProcess.running = parent.running;
        }
    }
}