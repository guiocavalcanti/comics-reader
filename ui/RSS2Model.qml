import Qt 4.7

XmlListModel { // TODO put the javascript in a .js module
    id: rssModel

    source: ""
    query: "/rss/channel/item"

    XmlRole { name: "comicTitle"; query: "title/string()" }
    XmlRole { name: "comicContent"; query: "description/string()" }
    XmlRole { name: "comicLink"; query: "link/string()" }

    function getImage(model) {
        if (model == undefined)
            return ""
        var src = model.comicContent.match(/<img(.*) src="([\w\d:#@%/;$()~_?\+-=\\\.& ]*)"/i)
        if (src != null) {
            return src[2]
        } else {
            delegate.width = 0
            return ""
        }
    }

    function getAlt(model) {
        if (model == undefined)
            return ""
        var alt = model.comicContent.match(/<img(.*) alt="(['\w\d:#@%/;$()~_?\+-=\\\.& ]*)"/i)
        if (alt != null)
            return alt[2]
        else
            return ""
    }

    function isValidComic(model) {
        return getImage(model) != ""
    }
}
