import Qt 4.7
import "feed.js" as Feed

Item {
    id: delegate

    property string image: Feed.getImage(model)
    property string alt: Feed.getAlt(model)
    property string title: model.comicTitle
    property bool isValidComic: image != ""
    property real scale: 1
    signal expand

    width: parent.parent.width
    height: parent.parent.height

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
        width: Math.min(strip.sourceSize.width, delegate.width)
        height: Math.min(strip.sourceSize.height, delegate.height - title.height - 20)

        anchors {
            top: title.bottom
            left: parent.left
            topMargin: 20
        }
        
        MouseArea {
            anchors.fill: parent
            onDoubleClicked: { expand() }
        }
    }
    
    ExpandButton {
        id: btExpand
        scale: delegate.scale
        onClicked: { expand() }
        anchors {
            right: parent.right
            rightMargin: 20
            bottom: parent.bottom
            bottomMargin: 20
        }
    }
}
