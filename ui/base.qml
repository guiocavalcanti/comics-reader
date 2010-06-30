import Qt 4.7

Item {
    id: window
    width: 800; height: 480;
    
    Image {
        id: background
        
        source: "images/background.jpg"
        anchors.fill: parent
    }
    
    ComicCanvas {
        anchors {
            top: parent.top
            topMargin: 30
            bottom: parent.bottom
            bottomMargin: 30
            right: right.left
            rightMargin: 20
            left: parent.left
            leftMargin: 30
        }
    }
    
    LeftButton {
        id: left
        anchors {
            right: parent.right
            rightMargin: 30
            verticalCenter: parent.verticalCenter           
        }
    }
    
    RightButton {
        id: right
        anchors {
            bottom: left.top
            right: parent.right
            rightMargin: 30
        }
    }
    
    ConfigButton {
        id: config
        anchors {
            top: left.bottom
            right: parent.right
            rightMargin: 30
        }
    }
    
}
