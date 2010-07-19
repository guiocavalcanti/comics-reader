import Qt 4.7

XmlListModel {
    id: rssModel
    source: "http://xkcd.com/rss.xml"
    query: "/rss/channel/item"
    
    XmlRole { name: "comicTitle"; query: "title/string()" }
    XmlRole { name: "comicContent"; query: "description/string()" }
    XmlRole { name: "comicLink"; query: "link/string()" }
}
