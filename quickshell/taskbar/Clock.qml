import QtQuick

import ".."

Text {
    text: Time.time
    color: Config.colors.text

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    font {
        family: fontMonaco.name
        pixelSize: 12
    }
}