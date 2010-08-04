import Qt 4.7

Item{
    id: comicView

    property string currentImage
    property string currentAlt
    property int borderSize: 40;
    signal exitFullscreen;

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
                    pointSize: 12
                    bold: true
                }
            }

            BusyIndicator {
                anchors.centerIn: parent
                on: { image.status == XmlListModel.Loading }
            }

            Image {
                source: "images/expand.png"
                opacity: 0.3
                anchors {
                    bottom: imageLabel.bottom
                    left: imageLabel.right
                }
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: comicView.exitFullscreen()
                }
            }
        }
    }
}
