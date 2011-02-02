import QtQuick 1.0

Image {
    id: indicator

    property alias busy: animation.running

    source: "images/busy.png"
    visible: busy
    width: 40; height: 40

    NumberAnimation on rotation {
        id: animation
        running: true
        from: 0; to: 360
        loops: Animation.Infinite
        duration: 1200
    }
}
