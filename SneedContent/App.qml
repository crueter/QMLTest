import QtQuick 6.2
import QtQuick.Controls 6.2
import Sneed

Window {
    id: window
    width: Constants.width
    height: Constants.height

    visible: true

    SwipeView {
        id: swipeView
        anchors.bottom: tabBar.top
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.left: parent.left
        currentIndex: tabBar.currentIndex

        Screen01 {
            id: screen1
        }

        Screen02 {
        }
    }

    TabBar {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        layer.enabled: false
        transformOrigin: Item.Center

        id: tabBar
        y: parent.height - height
        position: TabBar.Footer
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page Uno")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
