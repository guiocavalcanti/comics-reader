import Qt 4.7

Item {
    id: xkcd
    
    property int comicId;
    property string title;
    property string image;
    property string alt;
    
    anchors.fill: parent
    
    XmlListModel {
        id: xkcdModel
        //namespaceDeclarations: "declare default element namespace 'http://www.w3.org/1999/xhtml'";
        source: "http://xkcd.com/" + xkcd.comicId + "/";
        
        query: "//div[@class='s']/img";
        
        XmlRole { name: "title"; query: "@alt/string()" }
        XmlRole { name: "image"; query: "@src/string()" }
        XmlRole { name: "alt"; query: "@title/string()" }
        
        onStatusChanged: {
            console.log("*********"+source)
            if (status == XmlListModel.Ready) {
                xkcd.title = xkcdModel.get(0).title;
                xkcd.image = xkcdModel.get(0).image;
                xkcd.alt = xkcdModel.get(0).alt;
            }
        }
    }
}
