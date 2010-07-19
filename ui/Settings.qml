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
    Item {
        id: feedInput
        
        height: 60
        anchors {
            top: title.bottom
            topMargin: 25
            right: parent.right
            rightMargin: 10
            left: parent.left
            leftMargin: 10
            bottomMargin: 10
        }

        TextInput {
            text: "Add feed"
            color: "white"
            anchors {
                left: parent.left
                right: btAddFeed.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -5
                
            }
            font {
                pointSize: 18
                family: "Arial"
                bold: true
            }
            Rectangle { anchors.fill: parent; color: "white"; opacity: 0.2}
        }
        
        Button {
            id: btAddFeed
            
            label: "add"
            anchors {
                top: parent.top
                right: parent.right
            }
        }
    }
    ListView {
        id: feedView
        
        model: feedModel
        delegate: feedDelegate
        spacing: 5
        anchors {
            top: feedInput.bottom
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 10
            right: parent.right
        }
    }
    
}
