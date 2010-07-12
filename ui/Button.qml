import Qt 4.7

Item {
    id: button

    property alias iconPressed: icon.sourcePressed
    property alias iconUnpressed: icon.sourceUnpressed
    property alias label: label.text
    
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
    }
    
    Label { id: label }
    Icon { id: icon }
     
    MouseArea {
        id: mouseArea
        
        anchors.fill: parent
        onPressed: { 
            background.state  = "pressed" 
            label.state = "pressed"
            icon.state = "pressed"
        } 
        onReleased: { 
            background.state  = "unpressed"
            label.state = "unpressed"
            icon.state = "unpressed"
        } 
    }
}
