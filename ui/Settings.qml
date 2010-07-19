import Qt 4.7

Item {
    id: settings
    
    Component {
        id: feedDelegate
        
        Item {
            width: parent.width
            height: 30

            Text { 
                text: url
                color: "white"
                anchors {
                    left: tick.right
                    leftMargin: 10
                    right: btDelete.left
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter
                }
                font {
                    pointSize: 12
                    family: "Arial"
                    bold: true
                }
                
            }

            Item {
                id: tick
                
                width: 20; height: 20;
                anchors {
                    left: parent.left
                    leftMargin: 5
                    bottom: parent.bottom
                    bottomMargin: 5
                }
                
                Rectangle {
                    color: "white"
                    anchors.fill: parent
                }
            }

            Item {
                id: btDelete
                
                width: 20; height: 20;
                anchors {
                    right: parent.right
                    rightMargin: 5
                    bottom: parent.bottom
                    bottomMargin: 5
                }
                Rectangle {
                    color: white
                    anchors.fill: parent
                }
            }

            Rectangle {
                color: "white"
                opacity: 0.1
                anchors.fill: parent
            }
        
        }
    }
    
    ListModel {
        id: feedModel
        
        ListElement {
            url: "http://xkcd.com/rss.xml"
        }
        ListElement {
            url: "http://feeds.dilbert.com/DilbertMostPopular?format=xml"
        }
    }

    Text {
        id: title
        
        anchors {
            left: parent.left
            right: parent.righth
        }

        text: "Settings"
        color: "white"
        font {
            family: "Arial"
            bold: true
            pointSize: 20
        }
    }

    ListView {
        id: feedView
        
        model: feedModel
        delegate: feedDelegate
        spacing: 5
        anchors {
            top: title.bottom
            topMargin: 25
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 10
            right: parent.right
        }
    }
    
}
