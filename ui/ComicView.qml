import Qt 4.7

Item{
    id: comicView
    anchors.fill: parent
    
    property string image;
    property string alt;
    property string title;
    property int borderSize: 40;
    signal doubleClicked;
    
    
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
                source: comicView.image
            }
            Text {
                id: imageLabel
                anchors.top: image.bottom
                anchors.left: image.left
                anchors.right: image.right
                wrapMode: Text.WordWrap
                font.family: "Univers LT Std"
                font.pixelSize: 12
                font.bold: true
                font.italic: true
                color: "black"
                text: comicView.title
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
