import Qt 4.7

Item {
    id: button

    property alias iconPressed: icon.sourcePressed
    property alias iconUnpressed: icon.sourceUnpressed
    property alias label: label.text
    property alias enabled: mouseArea.enabled
    property bool pressed: false
    signal clicked
    
    width: 104; height: 52;
    
    Image {
        id: background
    
        property alias pressed: button.pressed
        property alias enabled: button.enabled
        
        source: "images/bt-normal.png"
        
        states: [
            State {
                name: "disabled"
                when: enabled == false
                PropertyChanges {
                    target: icon
                    opacity: 0.3
                }
            },
            
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
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: { button.clicked() }
    }
}
