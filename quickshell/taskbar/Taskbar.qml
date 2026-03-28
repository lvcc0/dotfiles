import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick

import ".."
import "TaskbarBox.qml"

import "Workspaces.qml"
import "SystemTray.qml"
import "Battery.qml"
import "Language.qml"
import "NetworkMonitor.qml"

// todo: add icons?
// todo: volume bar
// todo: brightness bar
// todo: bluetooth
// todo: taskbar opened programs

Scope {

Variants {
    model: Quickshell.screens
    
    Item {
        id: root
        required property var modelData

        PanelWindow {
            id: taskbar
            screen: root.modelData
            
            WlrLayershell.layer: WlrLayer.Bottom
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 36
            
            // --- taskbar body --- //
            Item {
                id: taskbarBody
                anchors.fill: parent

                // main body background
                Rectangle {
                    id: taskbarBackground
                    color: Config.colors.base

                    anchors {
                        fill: parent
                        margins: 0
                    }

                    border {
                        width: 1
                        color: Config.colors.outline
                    }
                }

                // bottom shadow
                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        margins: 1
                    }
                    
                    height: 3
                    color: Config.colors.shadow
                }

                // right shadow
                Rectangle {
                    anchors {
                        right: parent.right
                        bottom: parent.bottom
                        top: parent.top
                        margins: 1
                    }

                    width: 3
                    color: Config.colors.shadow
                }

                // top highlight
                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                        margins: 1
                    }

                    height: 3
                    color: Config.colors.highlight
                }
            }
            // --- //

            // --- left widgets --- //
            Row {
                spacing: 8
                height: parent.height

                anchors {
                    left: parent.left
                    leftMargin: 11
                    verticalCenter: parent.verticalCenter
                }

                TaskbarBox {
                    id: workspacesBody
                    width: workspaces.width + 5

                    Workspaces {
                        id: workspaces

                        anchors {
                            leftMargin: 2
                            rightMargin: 0
                        }
                    }
                }
            }
            // --- //

            // --- middle widgets --- //
            Row {
                spacing: 8
                height: parent.height

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                TaskbarBox {
                    id: clockBody
                    width: clock.width + 24

                    Clock {
                        id: clock
                    }
                }
            }
            // --- //

            // --- right widgets --- //
            Row {
                spacing: 8
                height: parent.height

                anchors {
                    right: parent.right
                    rightMargin: 12
                    verticalCenter: parent.verticalCenter
                }
                
                // network monitor
                TaskbarBox {
                    id: networkMonitorBody
                    width: networkMonitor.width + 16

                    NetworkMonitor {
                        id: networkMonitor
                    }
                }

                // keyboard layout
                TaskbarBox {
                    id: languageBody
                    width: language.width + 16

                    Language {
                        id: language
                    }
                }

                // system tray box
                TaskbarBox {
                    id: systemTrayBody
                    width: systemTray.width + 24

                    SystemTray {
                        id: systemTray
                    }
                }
            }
            // --- //
        }
    }
}

}
