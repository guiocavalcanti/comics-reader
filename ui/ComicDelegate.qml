import Qt 4.7

Item {
    id: delegate
    
    width: parent.parent.width
    height: parent.parent.height
    
    property string alt: getImageAttribute(comicContent, 1)
    property alias image: strip.source

    Text {
        id: title
        
        anchors {
            left: parent.left
            right: parent.righth
        }

        text: comicTitle
        color: "white"
        font {
            family: "Arial"
            bold: true
            pointSize: 20
        }
    }

    Image {
        id: strip
        
        fillMode: Image.PreserveAspectFit
        source: getImageAttribute(comicContent, 0)
        
        anchors {
            top: title.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
            topMargin: 10
        }
    }

    /* Returns the image attribute */
    function getImageAttribute(image, index){
       return image.match(/".*?"/g)[index].replace(/^"|"$/g, "");
    }
}
