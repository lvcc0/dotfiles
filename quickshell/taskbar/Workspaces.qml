import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import ".."

RowLayout {
    id: workspaces
    spacing: 2

    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
    }

    property var currentWorkspaces: Hyprland.workspaces.values.filter(x => x.monitor.name == taskbar.screen.name && x.id > 0)

    Repeater {
        model: parent.currentWorkspaces

        Button {
            id: control
            anchors.centerIn: parent.centerIn

            property int focusedWindowId: 0

            function buttonColor() {
                focusedWindowId = Hyprland.focusedWorkspace.id;

                if (modelData.urgent) {
                    return Config.colors.urgent;
                } else if (modelData.id == focusedWindowId || mouse.hovered) {
                    return Config.colors.shadow;
                } else {
                    return Config.colors.base;
                }
            }

            onPressed: event => {
                Hyprland.dispatch("workspace " + modelData.id)
                event.accepted = true;
            }

            HoverHandler {
                id: mouse
                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                cursorShape: Qt.PointingHandCursor
            }

            // button shadow
            Rectangle {
                color: Config.colors.outline
                z: -2

                width: 22
                height: 22

                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 4
                    leftMargin: 2
                }            
            }

            // button background
            background: Rectangle {
                width: 22
                height: 22
                color: buttonColor()

                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }

                border {
                    width: 1
                    color: Config.colors.outline
                }
            }

            // workspace id text
            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                width: 10
                height: 10

                text: modelData.id % 10
                color: Config.colors.text

                font {
                    family: fontMonaco.name
                    pixelSize: 12
                }
            }
        }
    }
}