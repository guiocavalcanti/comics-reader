import Qt 4.7

Item {
    id: button
    
    width: 78; height: 43;
        
    Image {
        id: background
        source: "images/bt-normal.png"
        
        states: [
            State {
                name: "unpressed"
                PropertyChanges { 
                    target: background
                    source: "images/bt-normal.png" 
                }
            },
            
            State {
                name: "pressed"
                PropertyChanges { 
                    target: background
                    source: "images/bt-pressed.png" 
                }
            }
        ]
        
        MouseArea {
            anchors.fill: parent
            onPressed: parent.state = "pressed"
            onReleased: parent.state = "unpressed"
        }
    }
}
