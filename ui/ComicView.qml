import Qt 4.7

Item{
    id: comicView
    /**
        #TODO a workaround for TypeError (comicView.currentItem)
        could be done passing the item index and the XMLListModel
    **/
    property Item currentItem
    property int borderSize: 40;
    signal doubleClicked;
    
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
                source: comicView.currentItem.image
            }

            Text {
                id: imageLabel
                
                color: "white"
                text: comicView.currentItem.alt
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

            MouseArea {
                id: mouseArea
                
                anchors.fill: parent
                onDoubleClicked: {
                    comicView.doubleClicked();
                }
            }
        }
    }
}
