import Qt 4.7

Text {
    id: label
    
    property bool pressed: false
    
    color: "black"
    font { bold: true; pointSize: 8; }
    anchors {
        horizontalCenter: parent.horizontalCenter
        horizontalCenterOffset: -1
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -1
    }
}
