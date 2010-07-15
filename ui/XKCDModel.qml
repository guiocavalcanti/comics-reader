import Qt 4.7

Item {
    id: xkcd
    
    property int comicId;
    property string title;
    property string image;
    property string alt;
    
    XmlListModel {
        id: xkcdModel
        namespaceDeclarations: "declare default element namespace 'http://www.w3.org/1999/xhtml';"
        source: "http://xkcd.com/" + xkcd.comicId + "/";
        
        query: "//div[@class='s']/img";
        
        XmlRole { name: "title"; query: "@title/string()" }
        XmlRole { name: "image"; query: "@src/string()" }
        XmlRole { name: "alt"; query: "@alt/string()" }
        
        onStatusChanged: {
            if (status == XmlListModel.Ready) {
                xkcd.title = get(0).title;
                xkcd.image = get(0).image;
                xkcd.alt = get(0).alt;
            }
        }
    }
}
