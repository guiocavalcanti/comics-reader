import Qt 4.7

ListView {
    id: comic
    property alias feed: rssModel.source;
    signal fullscreen;

    clip: true
    flickableDirection: Flickable.HorizontalFlick
    snapMode: ListView.SnapToItem
    orientation: ListView.Horizontal
    model: RSS2Model {id: rssModel}
    delegate: ComicDelegate { 
        onExpand: {
            comic.currentIndex = index
            fullscreen(index)
        }
    }
    spacing: 10

    BusyIndicator {
        anchors.centerIn: parent
        on: { comic.model.status == XmlListModel.Loading }
    }
}
