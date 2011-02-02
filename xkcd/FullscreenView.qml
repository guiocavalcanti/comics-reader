
import QtQuick 1.0

Rectangle {
    id: comicView

    property alias currentImage: image.source
    property alias currentAlt: imageLabel.text
    property alias status: image.status

    signal exitFullscreen

    color: "white"

    Flickable {
        anchors.fill: parent
        contentWidth: container.width
        contentHeight: container.height

        Item {
            id: container

            x: Math.max(0, (comicView.width - container.width) / 2)
            y: Math.max(0, (comicView.height - container.height) / 2)
            width: image.width
            height: image.height + imageLabel.height + 60

            Image {
                id: image
                smooth: true
                y: 20
                width: sourceSize.width
                height: sourceSize.height
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: imageLabel

                anchors {
                    top: image.bottom
                    topMargin: 20
                    leftMargin: 20
                    rightMargin: 20
                    left: image.left
                    right: image.right
                }
                color: "black"
                wrapMode: Text.WordWrap
                font {
                    family: "Arial"
                    pointSize: 16
                    bold: true
                }
            }

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: exitFullscreen()
            }
        }
    }

    BusyIndicator {
        anchors.centerIn: parent
        busy: parent.status != Image.Ready
    }
}
