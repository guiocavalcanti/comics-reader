import Qt 4.7

ListView {
    id: comic
    property alias feed: rssModel.source
    property real scale: 1
    property bool firstComic: comic.currentIndex == 0
    property bool lastComic: comic.currentIndex >= comic.count - 1
    signal fullscreen

    clip: true
    flickableDirection: Flickable.HorizontalFlick
    snapMode: ListView.SnapToItem
    orientation: ListView.Horizontal
    model: RSS2Model {id: rssModel}
    delegate: ComicDelegate {
        scale: comic.scale
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
    
    highlightMoveSpeed: 1200
}
