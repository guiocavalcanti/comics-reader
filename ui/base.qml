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
            topMargin: 20
            bottom: parent.bottom
            bottomMargin: 20
            right: left.left
            rightMargin: 20
            left: parent.left
            leftMargin: 20
        }
    }
    
    Button {
        id: left
        
        iconPressed: "images/left-white.png"
        iconUnpressed: "images/left-black.png"
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter           
        }
    }
    
    Button {
        id: right
        
        iconPressed: "images/right-white.png"
        iconUnpressed: "images/right-black.png"
        anchors {
            bottom: left.top
            right: parent.right
            rightMargin: 20
        }
    }
    
    Button {
        id: config
        
        iconPressed: "images/config-white.png"
        iconUnpressed: "images/config-black.png"
        anchors {
            top: left.bottom
            right: parent.right
            rightMargin: 20
        }
    }
    
    Button {
        id: textBt

        label: "Teste"
        anchors {
            top: config.bottom
            right: parent.right
            rightMargin: 20
        }
    }
}
