import Qt 4.7

import "feed.js" as Feed

ListModel {
    id: feeds
    signal invalidFeed(string url);
    
    Component.onCompleted: {
        var db = openDatabaseSync("feed", "1.0", "Comics Feeds SQL", 1000000, "QSQLITE");
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS Feeds(url STRING PRIMARY KEY, title STRING, description STRING)")
            tx.executeSql("INSERT OR IGNORE INTO Feeds (url, title, description) \
                VALUES ('http://xkcd.com/rss.xml','xkcd.com','xkcd.com: A webcomic of romance and math humor.')");
            var resultSet = tx.executeSql("SELECT url, title, description FROM Feeds ORDER BY title");
            for(var i = 0; i < resultSet.rows.length; i++){
                var result = resultSet.rows.item(i)
                var url = result.url;
                var title = result.title;
                var description = result.description;
                feeds.append({'url': url, 'title': title, 'description': description });
            }
        })
    }
    
    function getRssInfo(feedSample) {
        
        var channel = null
        for(var i = 0; i < feedSample.childNodes.length; i++) {
            if(feedSample.childNodes[i].nodeName == "channel")
                channel = feedSample.childNodes[i]
        }
        var title = ""
        var description = ""
        for(var i = 0; i < channel.childNodes.length; i++) { // TODO find out a better way to do this
            if(channel.childNodes[i].nodeName == "title")
                title = channel.childNodes[i].firstChild.nodeValue
            else if(channel.childNodes[i].nodeName == "description")
                description = channel.childNodes[i].firstChild.nodeValue
        }
        
        return {'title': title, 'description': description}
    }
    
    function validateFeed(url, onValidated, onInvalidFeed) {
        var doc = new XMLHttpRequest()
        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                if (doc.responseXML == null) {
                    onInvalidFeed(url)
                    return
                }
                
                var feedSample = doc.responseXML.documentElement
                if (feedSample.tagName.toString() == "rss") {
                    var feedInfo = feeds.getRssInfo(doc.responseXML.documentElement)
                    feedInfo['url'] = url
                    onValidated(feedInfo)
                } else {
                    onInvalidFeed(url)
                }
            }
        }
        doc.open("GET", url)
        doc.send()
    }
    
    function addFeed(url) {SQL
        var db = openDatabaseSync("feed", "1.0", "Comics Feeds SQL", 1000000, "QSQLITE")
        function _addFeed(feedInfo) {
            var title = feedInfo['title']
            var url = feedInfo['url']
            var description = feedInfo['description']
            db.transaction(function(tx) {
                tx.executeSql("INSERT OR IGNORE INTO Feeds (title, url, description) VALUES (?,?,?)", [title,url,description] ); // TODO stopped here =(
            })
            feeds.append(feedInfo)
        }
        validateFeed(url, _addFeed, invalidFeed);
    }
    
    function removeFeed(index) {
        var db = openDatabaseSync("feed", "1.0", "Comics Feeds SQL", 1000000, "QSQLITE")
        db.transaction(function(tx) {
            var url = feeds.get(index).url
            tx.executeSql("DELETE FROM Feeds WHERE url = ?", [url])
            feeds.remove(index)
        })
    }
}
