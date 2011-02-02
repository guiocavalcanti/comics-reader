
import QtQuick 1.0

Rectangle {
    id: controlTab
    height: 400
    width: 400
    radius: 200
    color: "gray"

    property int lastComicId

    signal randomComic(int randomComicId)

    Rectangle {
        anchors.centerIn: parent
        height: 350
        width: 350
        radius: 175
        color: "white"
    }

    Image {
        source: "images/random.png"
        scale: 2
        smooth: true
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 50
        }
        MouseArea {
            anchors.fill: parent
            anchors.margins: -30
            onClicked: controlTab.randomComic(Math.random() * lastComicId)
        }
    }
}