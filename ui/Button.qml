import Qt 4.7

Item {
    id: button

    property alias iconPressed: icon.sourcePressed
    property alias iconUnpressed: icon.sourceUnpressed
    property alias label: label.text
    property bool pressed: false
    property MouseArea mouseArea
    
    width: 78; height: 43;
    
    Image {
        id: background
    
        property bool pressed: false

        source: "images/bt-normal.png"
        
        states: [
            State {
                name: "unpressed"
                when: pressed == false
                PropertyChanges { 
                    target: background
                    source: "images/bt-normal.png" 
                }
            },
            
            State {
                name: "pressed"
                when: pressed == true
                PropertyChanges { 
                    target: background
                    source: "images/bt-pressed.png" 
                }
            }
        ]
    }
    
    Label { id: label }
    Icon { id: icon }
    
    Connections {
        target: mouseArea
        onPressed: {
            button.pressed = true
        }
        
        onReleased: {
            button.pressed = false
        }
    }
    
    onPressedChanged: {
        label.pressed = pressed
        icon.pressed = pressed
    }
    
    
}
