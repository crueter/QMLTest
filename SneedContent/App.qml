import QtQuick 6.2
import QtQuick.Controls 6.4
import Sneed

Window {
    id: window
    width: Constants.width
    height: Constants.height

    visible: true

    SwipeView {
        id: swipeView
        anchors.bottom: tabBar.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.left: parent.left
        currentIndex: tabBar.currentIndex

        SettingsPage {
        }

        ExercisePage {
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
            text: qsTr("Settings")
        }
        TabButton {
            text: qsTr("Exercise")
        }
        TabButton {
            text: qsTr("Food")
        }
        TabButton {
            text: qsTr("Recipes")
        }
        TabButton {
            text: qsTr("Goals")
        }
    }
}
