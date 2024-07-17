

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
    // width: 580
    // height: 400
    color: "#000000"

    property int mealNumber: 1

    property alias mealName: mealName

    Text {
        id: mealName
        x: 8
        color: "#ffffff"
        text: qsTr("Meal")

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: 20
        font.pixelSize: 21
        font.bold: true
        font.weight: Font.Medium
    }

    RoundButton {
        id: add
        x: 528
        width: 52
        height: 48
        text: "+"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 8
        anchors.topMargin: 8
        font.pointSize: 26
    }

    ListView {
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: roundButton.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 15
        anchors.bottomMargin: 15
        // TODO: FoodServing Model
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
