import Qt 4.7

Item {
    width: parent.parent.width
    height: parent.parent.height
    
    Text {
        id: comicTitle

        anchors {
            left: parent.left
            right: parent.righth
        }

        text: title
        color: "white"
        font {
            family: "Arial"
            bold: true
            pointSize: 20
        }
    }

    Image {
        id: comicImage
        
        fillMode: Image.PreserveAspectFit
        source: getImageAttribute(image, 0)
        anchors {
           top: comicTitle.bottom
           topMargin: 10
        }
    }

    /* Returns the image attribute */
    function getImageAttribute(image, index){
       return image.match(/".*?"/g)[index].replace(/^"|"$/g, "");
    }
}
