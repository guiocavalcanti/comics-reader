import Qt 4.7
import "feed.js" as Feed
ListView {
    id: comic
    spacing: 10
    highlightMoveSpeed: 1200
    highlightRangeMode: ListView.StrictlyEnforceRange
    clip: true
    flickableDirection: Flickable.HorizontalFlick
    snapMode: ListView.SnapToItem
    orientation: ListView.Horizontal

    property alias feed: rssModel.source
    property real scale: 1
    property bool firstComic: comic.currentIndex == 0
    property bool lastComic: comic.currentIndex >= comic.count - 1
    signal fullscreen

    model: RSS2Model {id: rssModel}
    delegate: ComicDelegate {
        scale: comic.scale
        onExpand: {
            comic.currentIndex = index
            fullscreen(index)
        }
    }

    BusyIndicator {
        anchors.centerIn: parent
        on: comic.model.status == XmlListModel.Loading
    }
}
