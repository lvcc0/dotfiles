import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

import ".."

Row {
    property PwNode node: Pipewire.defaultAudioSink; 

    spacing: 4
    visible: !node.audio.muted

    PwObjectTracker {
        objects: [ node ]
    }

    Rectangle {
        id: volumeRect
        color: "transparent"

        width: 8
        height: 16

        border {
            width: 1
            color: Config.colors.outline
        }

        Rectangle {
            color: Config.colors.accent 
            z: -1

            anchors.bottom: parent.bottom

            width: parent.width
            height: parent.height * (node.audio.volume)
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
                    text: `${Math.round(node.audio.volume * 100)}%`
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
