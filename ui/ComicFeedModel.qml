import Qt 4.7

XmlListModel { // TODO put the javascript in a .js module
    id: rssModel

    source: ""
    query: "/rss/channel/item"

    XmlRole { name: "comicTitle"; query: "title/string()" }
    XmlRole { name: "comicContent"; query: "description/string()" }
    XmlRole { name: "comicLink"; query: "link/string()" }
}
