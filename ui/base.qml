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
        
        opacity: 1
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
        
        onCurrentItemChanged: {
            fullscreen.currentImage = canvas.currentItem.image
            fullscreen.currentAlt = canvas.currentItem.alt
        }
    }
    
    ComicView {
        id: fullscreen
        
        opacity: 0
        onDoubleClicked: { 
            window.state = "normalView" 
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
            mouseArea: leftMouseArea

            MouseArea {
                id: leftMouseArea
                
                anchors.fill: parent
                
                onClicked: { canvas.decrementCurrentIndex() }
            }
        }

        Button {
            id: btRight

            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/right-white.png"
            iconUnpressed: "images/right-black.png"
            mouseArea: rightMouseArea

            MouseArea {
                id: rightMouseArea
                
                anchors.fill: parent
                
                onClicked: { canvas.incrementCurrentIndex() }
            }
        }

        Button {
            id: btRandom
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/random.png"
            iconUnpressed: "images/random.png"
        }

        Button {
            id: btConfig
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/expand.png"
            iconUnpressed: "images/expand.png"
            mouseArea: configMouseArea
            
            MouseArea {
                id: configMouseArea
                
                anchors.fill: parent
                
                onClicked: { 
                    window.state = "fullscreen" 
                }
            
            }
        }
    }

    states: [
        State {
            name: "fullscreen"
            PropertyChanges { target: fullscreen; opacity: 1 }
            PropertyChanges { target: canvas; opacity: 0 }
            PropertyChanges { target: controls; opacity: 0 }
        },
        State {
            name: "normalView"
            PropertyChanges { target: canvas; opacity: 1 }
            PropertyChanges { target: controls; opacity: 1 }
            PropertyChanges { target: fullscreen; opacity: 0 }
        }
    ]
}
