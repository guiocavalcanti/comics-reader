import Qt 4.7

Item {
    id: settings

    property string currentFeed: feedModel.get(0).url

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
    
    Feeds {
        id: feedModel
        onInvalidFeed:
            input.text = url
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
            Rectangle {
                color: "white"
                opacity: 0.2
                anchors.fill: parent
            }
        }

        Button {
            id: btAddFeed
            label: "add"
            enabled: input.text.match(/(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/) != null
            anchors {
                top: parent.top
                right: parent.right
            }

            onClicked: {
                feedModel.addFeed(feedInput.text)
                input.text = ""
            }
        }
    }

    ListView {
        id: feedView
        clip: true
        model: feedModel
        delegate: FeedDelegate {
            onDeletedFeed:
                feedModel.deleteFeed(index)
            onSelectedFeed:
                feedView.currentIndex = index
        }
        spacing: 5
        focus: true
        anchors {
            top: feedInput.bottom
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 10
            right: parent.right
        }
        highlightFollowsCurrentItem: true
        highlight: Rectangle {
            color: "lightsteelblue";
            width: parent.width
            opacity: 0.3
        }
        onCurrentItemChanged: {
            var index = feedView.currentIndex
            settings.currentFeed = feedModel.get(index).url
        }
    }
}
