import Qt 4.7
import "feed.js" as Feed

Item {
    id: delegate

    property string image: Feed.getImage(model)
    property string alt: Feed.getAlt(model)
    property string title: model.comicTitle
    property bool isValidComic: image != ""
    signal expand

    width: parent.parent.width
    height: parent.parent.height
    anchors {
        top: parent.top
        bottom: parent.bottom
    }

    Text {
        id: title
        text: (isValidComic) ? comicTitle : ""

        anchors {
            left: parent.left
        }
        width: parent.width
        elide: Text.ElideRight
        color: "white"
        font {
            family: "Arial"
            bold: true
            pointSize: 20
        }
    }

    Image {
        id: strip

        fillMode: Image.PreserveAspectFit
        source: image
        width: Math.min(strip.sourceSize.width, parent.width)

        anchors {
            top: title.bottom
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 15
            topMargin: 30
        }
    }
    
    ExpandButton {
        id: btExpand
        onClicked: { expand() }
        anchors {
            right: parent.right
            rightMargin: 20
            bottom: parent.bottom
            bottomMargin: 20
        }
    }
}
