import Qt 4.7

Item {
    id: delegate
    
    property string alt: getImageAttribute(comicContent, 1)
    property alias image: strip.source
    
    width: parent.parent.width
    height: parent.parent.height
    anchors {
        top: parent.top
        bottom: parent.bottom
    }

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
        width: Math.min(strip.sourceSize.width, parent.width)
        
        anchors {
            top: title.bottom
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 15
            topMargin: 30
        }
    }

    /* Returns the image attribute */
    function getImageAttribute(image, index){
       return image.match(/".*?"/g)[index].replace(/^"|"$/g, "");
    }
}
