
import QtQuick 1.0

Image {
    id: button

    property alias icon: buttonIcon.source
    property alias pressed: mouse.pressed

    signal clicked()

    source: "images/bt-normal.png"

    Image {
        id: buttonIcon
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        anchors.margins: -10
        onClicked: parent.clicked()
    }

    states: State {
        name: 'pressed'
        when: mouse.pressed
        PropertyChanges { target: button; source: "images/bt-pressed.png" }
    }
}