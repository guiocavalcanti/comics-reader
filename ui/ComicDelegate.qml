import Qt 4.7

Item {
    id: delegate

    RSS2Model {id: rssModel} // TODO import a .js module

    property string image: rssModel.getImage(model)
    property string alt: rssModel.getAlt(model)
    property string title: model.comicTitle
    property bool isValidComic: image != ""
    signal expand(int idx)

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
                expand(index)
            }
        }
    }
}
