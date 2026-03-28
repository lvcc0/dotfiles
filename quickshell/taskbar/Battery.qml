import Quickshell
import Quickshell.Services.UPower
import QtQuick

import ".."

Row {
    spacing: 4
    
    Rectangle {
        id: batteryRect
        color: "transparent"

        width: 8
        height: 16

        border {
            width: 1
            color: Config.colors.outline
        }

        Rectangle {
            color: UPower.displayDevice.percentage > 0.3 ? Config.colors.accent : Config.colors.urgent 
            z: -1

            anchors.bottom: parent.bottom

            width: parent.width
            height: parent.height * (UPower.displayDevice.percentage)
        }

        MouseArea {
            anchors.fill: parent

            HoverHandler {
                id: mouse
                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                cursorShape: Qt.PointingHandCursor
            }
        }
    }

    PopupWindow {
        id: tooltip
        visible: mouse.hovered

        implicitWidth: tooltipContents.width + 16
        implicitHeight: 24

        anchor {
            window: taskbar
            item: parent
            rect.y: taskbar.implicitHeight - parent.y * 2 + 4
            rect.x: parent.x
            edges: Edges.Bottom
        }

        Rectangle {
            anchors.fill: parent
            color: Config.colors.base

            border {
                width: 1
                color: Config.colors.outline
            }

            Row {
                id: tooltipContents
                spacing: 4

                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: UPower.displayDevice.percentage * 100 + "%"
                    color: Config.colors.text
                    
                    font.pixelSize: 12

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
        }
    }
}
