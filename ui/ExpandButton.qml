import Qt 4.7

Image {
    id: btExpand
    signal clicked
    property real scale: 2

    source: "images/expand.png"
    width: (visible) ? 32 * scale : 0; height: 31 * scale;

    MouseArea {
        id: expandMouseArea
        anchors.fill: parent
        onClicked: { btExpand.clicked() }
    }
}
