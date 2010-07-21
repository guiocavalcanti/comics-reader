import Qt 4.7

Item {
    id: feedsDB
    
    ListModel {
        id: listModel
    }
    
    function readData() {
        var db = openDatabaseSync("ComicsFeedsDB", "1.0", "Comics Feeds SQL", 1000000, "QSQLITE");
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS ComicsFeeds(title STRING, url STRING, subtitle STRING)")
            tx.executeSql("INSERT INTO ComicsFeeds (title, url, subtitle) VALUES ('xkcd.com','http://xkcd.com/rss.xml','xkcd.com: A webcomic of romance and math humor.')");
            var resultSet = tx.executeSql("SELECT title, url, subtitle FROM ComicsFeeds");
            for(var i = 0; i < resultSet.rows.length; i++){
                var titleField = resultSet.rows.item(i).name;
                var urlField = resultSet.rows.item(i).url;
                var subtitleField = resultSet.rows.item(i).subtitle;
                listModel.append({ title: titleField, url: urlField, subtitle: subtitleField });
            }
        })
        // TODO return model ?
    }
    
    function validateFeed() {
        
    }
    
    function addFeed(url) {
        // TODO validation
        var db = openDatabaseSync("ComicsFeedsDB", "1.0", "Comics Feeds SQL", 1000000, "QSQLITE");
        
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                db.transaction(function(tx) {
                    tx.executeSql("INSERT INTO ComicsFeeds (title, url, subtitle) VALUES (?,?,?)", [title,url,title] ); // TODO stopped here =(
                })
            }
        }
        doc.open("GET",url);
        doc.send();
    }
    
    Text {
        text: {
            feedsDB.readData();
            return listModel.get(0).url;
        }
    }
}
