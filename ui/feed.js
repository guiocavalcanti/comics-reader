/*
function randomXkcdFeed(onShowComic) {
    var doc = new XMLHttpRequest(); // not the best solution
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {
            var re = new RegExp("http://xkcd.com/([0-9]*)/")
            var match = re.exec(doc.responseText)
            var lastComicId = parseInt(match[1])
            fetchRandomXkcdFeed(lastComicId, onShowComic)
        }
    }
    doc.open("GET", "http://xkcd.com/rss.xml")
    doc.send()
}
*/
/*
function fetchRandomXkcdFeed(lastComicId, onShowComic) {
    var comicId = Math.floor(Math.random() * lastComicId) + 1
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {
            var img = doc.responseText.match(
                "<img(.*)src=\"(http://imgs.xkcd.com/comics/[\\w\\d:#@%/;$()~_?\\+-=\\\\\\.&  ]*)\"([\"'\\w\\d:#@%/;$()~_?\\+-=\\\\\\.&  ]*)/>")
            if (img != null) {
                var src = img[2]
                var others = img[1] + img[3]
                var alt = others.match("alt=\"(.*)\"" )
                if (alt != null)
                    alt = alt[1].split("\"")[0]
                else
                    alt = ""

                var title = others.match("title=\"(.*)\"" )
                if (title != null)
                    title = title[1].split("\"")[0]
                else
                    title = ""

                onShowComic(src,title)
            }
        }
    }
    doc.open("GET", "http://xkcd.com/" + comicId + "/")
    doc.send()
}
*/

function getImage(model) {
    if (model == undefined)
        return ""
    var src = model.comicContent.match(
        /<img(.*) src="([\w\d:#@%/;$()~_?\+-=\\\.& ]*)"/i)
        
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

