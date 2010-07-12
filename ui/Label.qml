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
    
    states: [
        State {
            name: "unpressed"
            when: { pressed == false }
            PropertyChanges {
                target: label
                color: "black"
            }
        },
        
        State {
            name: "pressed"
            when: { pressed == true }
            PropertyChanges {
                target: label
                color: "white"
            }
        }
    ]
}
