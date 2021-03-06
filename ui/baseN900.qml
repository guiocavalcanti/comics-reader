import Qt 4.7
import "feed.js" as Feed

Item {
    id: window
    width: 800; height: 480

    property bool loading: canvas.delegate.status == XmlListModel.Loading
    property int lastComicId
    property real scale: 2 // Scales items

    Image {
        id: background

        source: "images/background.png"
        anchors.fill: parent
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

            label: "feeds"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                if (window.state != "settings") {
                    window.state = "settings"
                } else {
                    window.state = "normalView"
                }
            }
        }

        Button {
            id: btRandom

            anchors.horizontalCenter: parent.horizontalCenter
            iconPressed: "images/random.png"
            iconUnpressed: "images/random.png"

            onClicked: {
                /* Real random xkcd feed
                Feed.randomXkcdFeed(function (src, alt) {
                    fullscreen.currentImage = src
                    fullscreen.currentAlt = alt
                    window.state = "fullscreen"
                })
                */
                canvas.highlightMoveDuration = 1
                canvas.currentIndex = Math.floor(
                    Math.random() * canvas.count)
                canvas.highlightMoveDuration = -1
            }
        }

        Button {
            id: btLeft

            anchors.horizontalCenter: parent.horizontalCenter
            enabled: !canvas.firstComic
            iconPressed: "images/left.png"
            iconUnpressed: "images/left.png"
            onClicked: { canvas.decrementCurrentIndex() }
        }

        Button {
            id: btRight

            anchors.horizontalCenter: parent.horizontalCenter
            enabled: !canvas.lastComic
            iconPressed: "images/right.png"
            iconUnpressed: "images/right.png"
            onClicked: { canvas.incrementCurrentIndex() }
        }
    }

    /* Canvas to place comics images */
    ComicCanvas {
        id: canvas
        scale: window.scale
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

    FullscreenView2 { // FullscreenView {
        id: fullscreen
        scale: window.scale
        opacity: 0
        onExitFullscreen: { window.state = "normalView" }
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
            PropertyChanges { target: canvas; opacity: 0.05 }
            PropertyChanges { target: controls; opacity: 1 }
            PropertyChanges { target: settings; opacity: 1 }
            PropertyChanges { target: btFeeds; label: "ok" }
            PropertyChanges { target: btRandom; enabled: false }
            PropertyChanges { target: btLeft; enabled: false }
            PropertyChanges { target: btRight; enabled: false }
        }
    ]
}
