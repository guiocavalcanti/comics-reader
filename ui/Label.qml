import Qt 4.7

Text {
    id: label
    
    color: "black"
    font { bold: true; pointSize: 8; }
    anchors {
        horizontalCenter: parent.horizontalCenter
        horizontalCenterOffset: -1
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -1
    }
    
    states: [
        State {
            name: "unpressed"
            PropertyChanges {
                target: label
                color: "black"
            }
        },
        
        State {
            name: "pressed"
            PropertyChanges {
                target: label
                color: "white"
            }
        }
    ]
}
