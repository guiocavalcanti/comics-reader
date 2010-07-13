import Qt 4.7

Item{
    id: comicView
    
    property string image;
    property string alt;
    property string title;
    property int borderSize: 40;
    signal doubleClicked;
    
    anchors.fill: parent
    
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
                
                color: "black"
                text: comicView.title
                wrapMode: Text.WordWrap
                anchors {
                    top: image.bottom
                    left: image.left
                    right: image.right
                }
                font {
                    family: "Univers LT Std"
                    pixelSize: 12
                    bold: true
                    italic: true
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
