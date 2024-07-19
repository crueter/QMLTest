

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

    height: 100

    property alias foodName: foodName
    property alias brandServing: brandServing
    property alias calories: calories

    Text {
        id: foodName
        color: "#ffffff"
        text: qsTr("Food Name")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 15
        anchors.topMargin: 15
        font.pixelSize: 22
        font.weight: Font.DemiBold
    }

    Text {
        id: brandServing
        color: "#c2c2c2"
        text: qsTr("Generic, 1 cup")
        anchors.left: parent.left
        anchors.top: foodName.bottom
        anchors.leftMargin: 25
        anchors.topMargin: 15
        font.pixelSize: 16
    }

    Text {
        id: calories
        x: 300
        color: "#c2c2c2"
        text: qsTr("0kcal")
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 25
        font.pixelSize: 18
    }
}
