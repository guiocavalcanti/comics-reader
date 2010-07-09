import Qt 4.7

XmlListModel {
    id: rssModel
    source: "http://xkcd.com/rss.xml"
    query: "/rss/channel/item"
    
    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "image"; query: "description/string()" }
}
