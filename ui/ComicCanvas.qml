import Qt 4.7

ListView {
    id: comic
    anchors.fill: parent
    clip: true
    flickableDirection: Flickable.HorizontalFlick
    
    model: RSS2Model {}
    delegate: ComicDelegate {}
}
