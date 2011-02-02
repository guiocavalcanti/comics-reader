
import Qt 4.7

Rectangle {
    id: root

    property alias currentImage: fullscreen.currentImage
    property alias currentAlt: fullscreen.currentAlt

    width: 800
    height: 480
    color: "white"

    ListModel {
        id: xkcdModel
        ListElement {
            titleText: "Learning to Cook"
            comicUrl: "http://imgs.xkcd.com/comics/learning_to_cook.png"
            altText: "Nice Comic"
        }
        ListElement {
            titleText: "Consecutive Vowels"
            comicUrl: "http://imgs.xkcd.com/comics/consecutive_vowels.png"
            altText: "Nice Comic"
        }
        ListElement {
            titleText: "Learning to Cook"
            comicUrl: "http://imgs.xkcd.com/comics/learning_to_cook.png"
            altText: "Nice Comic"
        }
        ListElement {
            titleText: "Consecutive Vowels"
            comicUrl: "http://imgs.xkcd.com/comics/consecutive_vowels.png"
            altText: "Nice Comic"
        }
        ListElement {
            titleText: "Learning to Cook"
            comicUrl: "http://imgs.xkcd.com/comics/learning_to_cook.png"
            altText: "Nice Comic"
        }
        ListElement {
            titleText: "Consecutive Vowels"
            comicUrl: "http://imgs.xkcd.com/comics/consecutive_vowels.png"
            altText: "Nice Comic Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero lectus, sollicitudin non pellentesque id, adipiscing vel risus. Nunc diam urna, tincidunt malesuada porta vel, bibendum et enim."
        }
        ListElement {
            titleText: "Learning to Cook"
            comicUrl: "http://imgs.xkcd.com/comics/learning_to_cook.png"
            altText: "Nice Comic"
        }
        ListElement {
            titleText: "Consecutive Vowels"
            comicUrl: "http://imgs.xkcd.com/comics/consecutive_vowels.png"
            altText: "Nice Comic"
        }
    }

    Component {
        id: comicDelegate
        ComicDelegate {
            height: root.height
            width: root.width / 2
            title: index + ' - ' + titleText
            alt: altText
            comic: comicUrl
            onFullscreen: {
                root.currentImage = comicUrl;
                root.currentAlt = altText;
                root.state = 'fullscreen';
            }
        }
    }

    ListView {
        id: comicsList
        anchors.fill: parent
        model: xkcdModel
        orientation: ListView.Horizontal
        header: Item { width: root.width / 4 }
        footer: Item { width: root.width / 4 }
        delegate: comicDelegate
    }

    Button {
        id: randomButton
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
        icon: "images/random.png"
        onClicked: { comicsList.positionViewAtIndex(Math.random() * xkcdModel.count, ListView.Center) }
    }

    Image {
        anchors.bottom: randomButton.top
        anchors.left: randomButton.bottom
        source: "images/random_number.png"
        visible: randomButton.pressed
    }

    Button {
        id: exitButton
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        Text {
            anchors.centerIn: parent
            font.pixelSize: 32
            text: "<b>X</b>"
        }
        onClicked: { Qt.quit() }
    }

    FullscreenView {
        id: fullscreen
        anchors.fill: parent
        enabled: false
        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 500 } }
        onExitFullscreen: { root.state = '' }
    }

    states: State {
        name: 'fullscreen'
        PropertyChanges {
            target: fullscreen
            enabled: true
            opacity: 1
        }
    }
}