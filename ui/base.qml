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
        feed: settings.currentFeed
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
        
        onFullscreen: {
            fullscreen.currentImage = canvas.currentItem.image
            fullscreen.currentAlt = canvas.currentItem.alt
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

        Button { // TODO Works only with XKCD feed
            id: btRandom
            
            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/random.png"
            iconUnpressed: "images/random.png"
            
            MouseArea {
                anchors.fill: parent
                
                onClicked: {
                    var re = new RegExp("^http://xkcd.com/([0-9]*)/$")
                    var match = re.exec(canvas.model.get(0).comicLink)
                    var lastComicId = parseInt(match[1])
                    var comicId = Math.floor(Math.random() * lastComicId) + 1
                    var doc = new XMLHttpRequest(); // not the best solution
                    doc.onreadystatechange = function() {
                        if (doc.readyState == XMLHttpRequest.DONE) {
                            var img = doc.responseText.match(
                                "<img(.*)src=\"(http://imgs.xkcd.com/comics/[\\w\\d:#@%/;$()~_?\\+-=\\\\\\.&  ]*)\"([\"'\\w\\d:#@%/;$()~_?\\+-=\\\\\\.&  ]*)/>")
                            var src = img[2]
                            var others = img[1] + img[3]
                            var alt = others.match("alt=\"(.*)\"" )
                            if (alt != null){
                                alt = alt[1].split("\"")[0].replace("&#39;","'") // TODO find a better way to do this
                            } else {
                                alt = ""
                            }
                            var title = others.match("title=\"(.*)\"" )
                            if (title != null){
                                title = title[1].split("\"")[0].replace("&#39;","'") // TODO find a better way to do this
                            } else {
                                title = ""
                            }
                            fullscreen.currentImage = src
                            fullscreen.currentAlt = title
                            window.state = "fullscreen"
                        }
                    }
                    doc.open("GET", "http://xkcd.com/" + comicId + "/")
                    doc.send()
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
