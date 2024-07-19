import QtQuick
import QtQuick.Controls
import Sneed

Window {
    id: window
    width: Constants.width
    height: Constants.height

    visible: true

    // TODO: date picker

    Dialog {
        id: search
        width: window.width
        height: window.height

        property alias food: food

        FoodSearchImpl {
            id: food
            width: parent.width
            height: parent.height

            back.onClicked: search.reject()
        }
    }

    Dialog {
        id: foodEdit
        width: window.width
        height: window.height

        property alias edit: edit

        FoodServingEditImpl {
            id: edit
            width: parent.width
            height: parent.height

            back.onClicked: foodEdit.reject()
        }
    }


    SwipeView {
        id: swipeView
        objectName: "swipeView"
        anchors.bottom: tabBar.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.top: dateSelect.bottom
        anchors.left: parent.left
        currentIndex: tabBar.currentIndex

        SettingsPage {
        }

        ExercisePageImpl {
            Component.onCompleted: exercises.loadData(new Date())
        }

        FoodPageImpl {
        }

        RecipesPageImpl {
        }

        GoalsPageImpl {
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

    DateSelect {
        id: dateSelect
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
