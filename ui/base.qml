import Qt 4.7

Item {
    id: window
    width: 800; height: 480;
    
    property bool loading: canvas.delegate.status == XmlListModel.Loading
    property int lastComicId: 768;
    
    Image {
        id: background

        source: "images/background.png"
        anchors.fill: parent
    }
    
    /* Canvas to place comics images */
    ComicCanvas {
        id: canvas
        
        opacity: 1
        anchors {
            topMargin: 15
            top: parent.top
            leftMargin: 15
            left: parent.left
            bottomMargin: 20
            bottom: parent.bottom
            rightMargin: 15
            right: controls.left
        }

        Image {
            id: btExpand
            
            source: "images/expand.png"
            width: 32; height: 31;
            anchors {
                right: parent.right
                rightMargin: 20
                bottom: parent.bottom
                bottomMargin: 20
            }
            
            MouseArea {
                id: expandMouseArea
                
                anchors.fill: parent
                
                onClicked: { 
                    window.state = "fullscreen" 
                }
            }
        }
        
        onCurrentItemChanged: {
            fullscreen.currentImage = canvas.currentItem.image
            fullscreen.currentAlt = canvas.currentItem.alt
        }
        
        onExpand: {
            window.state = "fullscreen"
        }
    }
    
    ComicView {
        id: fullscreen
        
        opacity: 0
        onDoubleClicked: {
            window.state = "normalView"
        }
    }
    
    XKCDModel {
        id: xkcdModel
        comicId: Math.floor(Math.random() * lastComicId) + 1
    }
    
    Settings {
        id: settings
        
        opacity: 0
        
        anchors {
            topMargin: 15
            top: parent.top
            leftMargin: 15
            left: parent.left
            bottomMargin: 20
            bottom: parent.bottom
            rightMargin: 15
            right: controls.left
        }
    }
    
    Image {
        id: logo
        
        source: "images/logo.png"
        anchors {
            right: parent.right
            rightMargin: 20
            top: parent.top
            topMargin: 15
        }
    }

    Column {
        id: controls
        
        width: 95
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }

        Button {
            id: btFeeds
            
            label: "feed"
            anchors.horizontalCenter: parent.horizontalCenter
            mouseArea: feedMouseArea
            
            MouseArea {
                id: feedMouseArea
                
                anchors.fill: parent
                
                onClicked: {
                    window.state = "settings"
                }
            }
        }

        Button {
            id: btRandom
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/random.png"
            iconUnpressed: "images/random.png"
            
            MouseArea {
                anchors.fill: parent
                
                onClicked: {
                    var re = new RegExp("^http://xkcd.com/([0-9]*)/$")
                    var match = re.exec(canvas.model.get(0).comicLink)
                    lastComicId = parseInt(match[1])
                    xkcdModel.comicId = Math.floor(Math.random() * lastComicId) + 1
                    fullscreen.currentImage = xkcdModel.image
                    fullscreen.currentAlt = xkcdModel.alt
                    window.state = "fullscreen"
                }
            }
        }

        Button {
            id: btLeft
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/left.png"
            iconUnpressed: "images/left.png"
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
            iconPressed: "images/right.png"
            iconUnpressed: "images/right.png"
            mouseArea: rightMouseArea

            MouseArea {
                id: rightMouseArea
                
                anchors.fill: parent
                
                onClicked: { canvas.incrementCurrentIndex() }
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
        },
        State {
            name: "settings"
            PropertyChanges { target: canvas; opacity: 0 }
            PropertyChanges { target: controls; opacity: 1 }
            PropertyChanges { target: settings; opacity: 1 }
        }
    ]
}
