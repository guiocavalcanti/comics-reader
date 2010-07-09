import Qt 4.7

Component {
    Item {
        anchors.fill: parent
        
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
            
            source: getImageAttribute(image, 0)
            anchors {
               top: comicTitle.bottom
               topMargin: 10
            }
        }
        
        Text {
            id: comicDescription
            
            height: 100; width: 100;
            anchors {
                top: comicImage.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: getImageAttribute(image, 1)
            color: "white"
            
        }
        
        /* Returns the image attribute */
        function getImageAttribute(image, index){
           return image.match(/".*?"/g)[index].replace(/^"|"$/g, "");
        }
    }
    
}
