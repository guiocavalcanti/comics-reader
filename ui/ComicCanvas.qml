import Qt 4.7

ListView {
    id: comic
    
    signal expand;
    
    clip: true
    flickableDirection: Flickable.HorizontalFlick
    orientation: ListView.Horizontal
    model: RSS2Model {}
    delegate: ComicDelegate {}
    spacing: 10

    BusyIndicator {
        anchors.centerIn: parent
        on: { comic.model.status == XmlListModel.Loading }
    }

    Image {
        id: btExpand
        
        source: "images/expand.png"
        width: 32; height: 31;
        anchors {
            right: parent.right
            rightMargin: 20
            bottom: parent.bottom
            bottomMargin: 20
        }
        
        MouseArea {
            id: expandMouseArea
            
            anchors.fill: parent
            
            onClicked: { 
                expand()
            }
        }
    }
}
