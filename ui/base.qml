import Qt 4.7

Item {
    id: window
    width: 800; height: 480;
    
    
    Image {
        id: background

        source: "images/background.jpg"
        anchors.fill: parent
    }

    /* Canvas to place comics images */
    ComicCanvas {
        id: canvas

        anchors {
            topMargin: 20
            top: parent.top
            leftMargin: 20
            left: parent.left
            bottomMargin: 20
            bottom: parent.bottom
            rightMargin: 10
            right: controls.left
        }
    }

    Column {
        id: controls

        width: 80
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }

        Button {
            id: btLeft

            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/left-white.png"
            iconUnpressed: "images/left-black.png"
        }

        Button {
            id: btRight
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/right-white.png"
            iconUnpressed: "images/right-black.png"
        }

        Button {
            id: btConfig
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/config-white.png"
            iconUnpressed: "images/config-black.png"
        }

        Button {
            id: btAlt
            
            anchors.horizontalCenter: parent.horizontalCenter
            label: "alt"
        }
    }
}

