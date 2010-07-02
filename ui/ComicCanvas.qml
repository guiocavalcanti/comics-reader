import Qt 4.7

Item {
    id: comicCanvas
    
    Flickable {
        anchors.fill: parent 
        contentWidth: comic.width; contentHeight: comic.height;
        clip: true
        
        Image {
            id: comic
            source: "http://imgs.xkcd.com/comics/journal_2.png"
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }   
    }
    
    Rectangle {
        id: legend
        
        color: "black"
        opacity: 0.5
        radius: 10
        z: 1
        
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        
    }
}
