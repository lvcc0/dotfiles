import Quickshell
import Quickshell.Services.UPower
import QtQuick

import ".."

Row {
    spacing: 4

    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }

    Text {
        text: Math.round(UPower.displayDevice.percentage * 100) + "%"
        color: Config.colors.text

        font {
            family: fontMonaco.name
            pixelSize: 12
        }
    }

    Text {
        visible: UPower.displayDevice.timeToEmpty > 0
        text: "(" + Math.floor(UPower.displayDevice.timeToEmpty / 60) + "m)"
        color: Config.colors.text
        
        font.pixelSize: 12

        font {
            family: fontMonaco.name
            pixelSize: 12
        }
    }
}