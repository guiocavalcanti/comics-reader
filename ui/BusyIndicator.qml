import Qt 4.7 

Image {
    id: indicator

    property bool on: false

    source: "images/busy.png"
    visible: indicator.on
    width: 40; height: 40;

    NumberAnimation on rotation {
        running: indicator.on
        from: 0; to: 360;
        loops: Animation.Infinite
        duration: 1200
    }
}
