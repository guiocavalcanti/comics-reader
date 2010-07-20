import Qt 4.7

Item {
    id: settings

    property string currentFeed: feedModel.get(0).url;

    Component {
        id: feedDelegate
        Item {
            width: parent.width
            height: 50

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
                width: 32; height: 32;
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 10
                }

                Image {
                    id: tickImg
                    property bool ticked: false
                    
                    states: [
                        State {
                            name: "tick"
                            when: tickImg.ticked == false
                            PropertyChanges {
                                target: tickImg
                                source: "images/bt-radio-white.png"
                            }
                        },

                        State {
                            name: "untick"
                            when: tickImg.ticked == true
                            PropertyChanges {
                                target: tickImg
                                source: "images/bt-radio-orange.png"
                            }
                        }
                    ]

                    MouseArea { 
                        id: tickImgArea
                        anchors.fill: parent
                        onClicked: {
                            tickImg.ticked = (tickImg.ticked) ? false : true
                        }
                    }
                }
            }

            Item {
                id: btDelete
                width: 32; height: 32;
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 10
                }

                Image {
                    id: trashImg
                    source: "images/bt-trash.png"
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
            url: "http://henrik.nyh.se/scrapers/cyanide_and_happiness.rss"
        }
        ListElement {
            url: "http://feeds.feedburner.com/wondermark" // Doing
        }
        ListElement {
            url: "http://hazsci.thecomicseries.com/rss/" // Ok
        }
        ListElement {
            url: "http://feeds.dilbert.com/DilbertMostPopular?format=xml" // Ok
        }
        ListElement {
            url: "http://www.darthsanddroids.net/rss_noannotation.xml" // Ok
        }
        ListElement {
            url: "http://www.irregularwebcomic.net/rss2.xml" // Ok
        }
        ListElement {
            url: "http://xkcd.com/rss.xml" // Ok
        }
        ListElement {
            url: "http://tmi-comic.com/feed/" // Ugly
        }
        ListElement {
            url: "http://feeds.feedburner.com/JaysHindsight" // TODO this feed has some images which can't be opened due to unsafe connections
        }

        ListElement {
            url: "http://www.questionablecontent.net/QCRSS.xml" // TODO this feed has more than one image per feed entry and the comic is not the first.
        }
    }

    Text {
        id: title
        text: "Settings"
        color: "white"
        anchors {
            left: parent.left
            right: parent.righth
        }
        font {
            family: "Trebuchet MS"
            bold: true
            pointSize: 20
        }
    }
    Item {
        id: feedInput
        property alias text: input.text
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
            id: input
            color: "white"
            validator: RegExpValidator { regExp: /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/ }
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
        }

        Button {
            id: btAddFeed
            label: "add"
            mouseArea: addFeedMouseArea
            anchors {
                top: parent.top
                right: parent.right
            }

            MouseArea {
                id: addFeedMouseArea
                anchors.fill: parent
                onClicked: {
                    if(input.acceptableInput){
                        feedModel.append({"url" : feedInput.text})
                    }
                }
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
