

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
    color: "#000000"

    property alias back: back

    Text {
        id: text1
        color: "#ffffff"
        text: qsTr("Food Search")
        anchors.top: parent.top
        anchors.topMargin: 10
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
    }

    TabBar {
        id: tabBar
        height: 48
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: text1.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 53

        position: TabBar.Header
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Online")
        }
        TabButton {
            text: qsTr("Offline")
        }
        TabButton {
            text: qsTr("Recipes")
        }
    }

    SwipeView {
        id: swipeView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tabBar.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 15
        anchors.bottomMargin: 15

        objectName: "swipeView"
        currentIndex: tabBar.currentIndex

        ListView {
            id: online
            // anchors.fill: parent
            // TODO: FoodItem model
            model: ListModel {}
            delegate: Row {
                spacing: 5
                Rectangle {
                    width: 100
                    height: 20
                    color: colorCode
                }

                Text {
                    width: 100
                    text: name
                }
            }
        }

        ListView {
            id: offline
            // anchors.fill: parent
            // TODO: FoodItem model
            model: ListModel {}
            delegate: Row {
                spacing: 5
                Rectangle {
                    width: 100
                    height: 20
                    color: colorCode
                }

                Text {
                    width: 100
                    text: name
                }
            }
        }

        ListView {
            id: recipes
            // anchors.fill: parent
            // TODO: FoodItem model
            model: ListModel {}
            delegate: Row {
                spacing: 5
                Rectangle {
                    width: 100
                    height: 20
                    color: colorCode
                }

                Text {
                    width: 100
                    text: name
                }
            }
        }
    }

    Button {
        id: back
        width: 50
        height: 50
        text: qsTr("<")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.topMargin: 0
        font.pointSize: 26
    }

    TextField {
        id: textField
        anchors.left: parent.left
        anchors.right: toolButton.left
        anchors.top: back.bottom
        anchors.bottom: tabBar.top
        anchors.leftMargin: 8
        anchors.rightMargin: 15
        anchors.topMargin: 4
        anchors.bottomMargin: 6
        placeholderText: qsTr("Query")
    }

    ToolButton {
        id: toolButton
        x: 551
        text: qsTr("Submit")
        anchors.right: parent.right
        anchors.top: textField.top
        anchors.bottom: textField.bottom
        anchors.rightMargin: 15
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        flat: true
    }
}
