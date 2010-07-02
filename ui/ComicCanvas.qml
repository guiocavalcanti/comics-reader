import Qt 4.7

Item {
    id: comicCanvas
    
    Text {
        id: title
        text: "XKCD Title"
        color: "white"
        font {
            family: "Arial"
            bold: true
            pointSize: 20
        }
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }    
    
    Flickable {
        opacity: 12
        clip: true
        contentWidth: comic.width; contentHeight: comic.height;
        anchors {
            top: title.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 10
        }
        
        Image {
            id: comic
            source: "http://imgs.xkcd.com/comics/journal_2.png"
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }   
    }
    
    
}
