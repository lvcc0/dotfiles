import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import ".."
import "Clock.qml"

RowLayout {
    id: systemTray
    spacing: 6

    anchors {
        right: parent.right
        rightMargin: 12
        verticalCenter: parent.verticalCenter
    }

    Repeater {
        model: SystemTray.items

        MouseArea {
            id: trayItem
            property SystemTrayItem item: modelData

            implicitWidth: 16
            implicitHeight: 16

            onClicked: event => {
                switch (event.button) {
                case Qt.LeftButton:
                    if (item.hasMenu) {
                        menu.open();
                    }
                    break;
                case Qt.RightButton:
                    // todo
                    break;
                case Qt.MiddleButton:
                    // todo
                    break;
                }

                event.accepted = true;
            }

            HoverHandler {
                id: mouse
                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                cursorShape: Qt.PointingHandCursor
            }

            Loader {
                anchors.fill: trayIcon

                sourceComponent: MultiEffect {
                    source: trayIcon
                    
                    blurEnabled: false
                    shadowEnabled: true
                    
                    saturation: -1
                    contrast: 0.7
                    opacity: mouse.hovered || menu.visible ? 1 : 0.7

                    shadowBlur: 0
                    shadowScale: 1
                    shadowVerticalOffset: 1
                    shadowHorizontalOffset: 1
                    shadowOpacity: 1
                    shadowColor: Config.colors.outline
                }
            }

            QsMenuAnchor {
                id: menu
                menu: trayItem.item.menu

                anchor {
                    window: taskbar

                    rect.x: trayItem.x + (taskbar.width - systemTray.width)
                    rect.y: taskbar.height - 10
                }
            }

            IconImage {
                id: trayIcon
                source: trayItem.item.icon
                visible: false

                width: parent.width
                height: parent.height

                anchors.centerIn: parent
            }
        }
    }

    Clock {
        id: clock
    }

}