import Qt 4.7

Image {
    id: icon
    
    property string sourcePressed
    property string sourceUnpressed
    property bool pressed: false
    
    width: 24; height: 24;
    x: 25; y: 8;
    fillMode: Image.PreserveAspectFit
    source: sourceUnpressed
    
    states: [
        State {
            name: "pressed"
            when: pressed == true
            PropertyChanges {
                target: icon
                source: sourcePressed
            }
        },
        
        State {
            name: "unpressed"
            when: pressed == false
            PropertyChanges {
                target: icon
                source: sourceUnpressed
            }
        }
    ]
}
