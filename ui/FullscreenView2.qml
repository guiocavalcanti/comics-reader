import Qt 4.7

Item{
    id: comicView

    property string currentImage
    property string currentAlt
    property real scale: 1
    property int borderSize: 60 * scale
    signal exitFullscreen

    anchors.fill: parent

    Rectangle {
        id: blackout
        color: "white"
        anchors.fill: parent
    }
    
    Flickable {
        anchors.fill: parent
        contentWidth: container.width
        contentHeight: container.height

        Item {
            id: container
            width: image.width
            height: image.height + imageLabel.height + 20
            
            Image {
                id: image
                source: currentImage
                width: sourceSize.width * comicView.scale
                height: sourceSize.height * comicView.scale
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onDoubleClicked: { comicView.exitFullscreen() }
                }
            }

            Text {
                id: imageLabel

                color: "black"
                text: comicView.currentAlt
                wrapMode: Text.WordWrap
                anchors {
                    top: image.bottom
                    topMargin: 20
                    left: image.left
                    right: image.right
                }
                font {
                    family: "Arial"
                    pointSize: 12 * comicView.scale
                    bold: true
                }
            }

            BusyIndicator {
                anchors.centerIn: parent
                on: { image.status == XmlListModel.Loading }
            }
        }
    }
    ExpandButton {
        scale: 2
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
        onClicked:
            exitFullscreen()
    }
}
