import QtQuick 1.0

Item {
    id: delegate

    property string title
    property string alt
    property url comic

    signal fullscreen()

    Text {
        id: titleText // Model Data
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        elide: Text.ElideRight
        text: title
        color: "black"
        font {
            pixelSize: 38
            family: "Nokia Sans"
        }
    }
    Image {
        id: comicImage
        anchors {
            top: titleText.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        source: comic // Model Data
        fillMode: Image.PreserveAspectFit
        BusyIndicator {
            anchors.centerIn: parent
            busy: parent.status != Image.Ready
        }
    }

    MouseArea {
        anchors.fill: parent
        onDoubleClicked: delegate.fullscreen()
    }
}