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
        color: "black"
        anchors.fill: parent
    }
    Flickable {
        anchors.fill: parent
        contentWidth: container.width
        contentHeight: container.height

        Item {
            id: container
            width: image.width + borderSize * 2
            height: image.height + imageLabel.height + borderSize * 2
            x: {
                if ( comicView.width > image.width)
                    return (comicView.width - container.width)/2 + borderSize
                else
                    return borderSize
            }
            y: {
                if ( comicView.height > image.height)
                    return (comicView.height - container.height)/2 + borderSize
                else
                    return borderSize
            }

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

                color: "white"
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
            
            ExpandButton {
                scale: comicView.scale
                anchors {
                    bottom: image.top
                    right: imageLabel.left
                }
                onClicked: { comicView.exitFullscreen() }
            }
            ExpandButton {
                scale: comicView.scale
                anchors {
                    bottom: imageLabel.bottom
                    left: imageLabel.right
                }
                onClicked: { comicView.exitFullscreen() }
            }
        }
    }
}
