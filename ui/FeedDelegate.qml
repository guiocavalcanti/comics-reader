import Qt 4.7

Item {
    width: parent.width
    height: 50
    
    signal deletedFeed(int index)
    signal selectedFeed(int index)

    MouseArea {
        anchors.fill: parent
        onClicked: selectedFeed(index)
    }

    Text {
        text: model.title
        color: "white"
        anchors {
            left: parent.left
            leftMargin: 10
            right: button.left
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }
        font {
            pointSize: 12
            family: "Arial"
            bold: true
        }
    }

    Image {
        id: button
        signal deletedFeed
        source: "images/bt-trash.png"
        width: 32; height: 32
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 10
        }
        
        MouseArea {
            anchors.fill: parent
            onClicked:
                deletedFeed(index)
        }
    }

    Rectangle {
        color: "white"
        opacity: 0.1
        anchors.fill: parent
    }
}
