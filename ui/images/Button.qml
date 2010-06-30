import Qt 4.7

Item {
    id: button

    width: 78; height: 43;
    
    MouseArea {
        anchors.fill: parent
        Image {
            source: "images/bt-normal.png"
        }
    }
}
