import Quickshell
import QtQuick

import ".."

Item {
    id: box
    height: parent.height - 6

    anchors.verticalCenter: parent.verticalCenter

    // box background
    Rectangle {
        color: Config.colors.shadow
        
        border {
            width: 1
            color: Config.colors.outline
        }

        anchors {
            fill: parent
            bottomMargin: -1
        }

        // bottom border "overwriting"
        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            height: 1
            color: Config.colors.shadow
        }
    }
}