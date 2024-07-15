

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard 6.2
import Sneed

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"
    property alias title: title

    Text {
        id: title
        color: "#ffffff"
        text: "Settings"
        anchors.top: parent.top
        anchors.topMargin: 10
        font.pixelSize: 24
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: Constants.largeFont.family
    }

    Text {
        id: meal1
        x: 22
        color: "#ffffff"
        text: qsTr("Meal 1 Name:")
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.leftMargin: 19
        anchors.topMargin: 20
        font.pixelSize: 20
        font.underline: true
        font.bold: false
    }

    TextField {
        id: meal1Name
        y: 56
        height: 35
        color: "#ffffff"
        text: qsTr(settings.meal1Name)
        anchors.left: meal1.right
        anchors.right: parent.right
        anchors.bottom: meal1.bottom
        anchors.leftMargin: 22
        anchors.rightMargin: 5
        anchors.bottomMargin: 0
        font.pixelSize: 18
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.NoWrap
        cursorVisible: true

        onEditingFinished: settings.meal1Name = text
    }

    Text {
        id: meal2
        x: 22
        color: "#ffffff"
        text: qsTr("Meal 2 Name:")
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.leftMargin: 19
        anchors.topMargin: 70
        font.pixelSize: 20
        font.underline: true
        font.bold: false
    }

    TextField {
        id: meal2Name
        y: 106
        height: 35
        color: "#ffffff"
        text: qsTr(settings.meal2Name)
        anchors.left: meal2.right
        anchors.right: parent.right
        anchors.bottom: meal2.bottom
        anchors.leftMargin: 22
        anchors.rightMargin: 5
        anchors.bottomMargin: 0
        font.pixelSize: 18
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.NoWrap
        cursorVisible: true

        onEditingFinished: settings.meal2Name = text
    }

    Text {
        id: meal3
        x: 22
        color: "#ffffff"
        text: qsTr("Meal 3 Name:")
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.leftMargin: 19
        anchors.topMargin: 120
        font.pixelSize: 20
        font.underline: true
        font.bold: false
    }

    TextField {
        id: meal3Name
        y: 156
        height: 35
        color: "#ffffff"
        text: qsTr(settings.meal3Name)
        anchors.left: meal3.right
        anchors.right: parent.right
        anchors.bottom: meal3.bottom
        anchors.leftMargin: 22
        anchors.rightMargin: 5
        anchors.bottomMargin: 0
        font.pixelSize: 18
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.NoWrap
        cursorVisible: true

        onEditingFinished: settings.meal3Name = text
    }

    Text {
        id: meal4
        x: 22
        color: "#ffffff"
        text: qsTr("Meal 4 Name:")
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.leftMargin: 19
        anchors.topMargin: 170
        font.pixelSize: 20
        font.underline: true
        font.bold: false
    }

    TextField {
        id: meal4Name
        y: 206
        height: 35
        color: "#ffffff"
        text: qsTr(settings.meal4Name)
        anchors.left: meal4.right
        anchors.right: parent.right
        anchors.bottom: meal4.bottom
        anchors.leftMargin: 22
        anchors.rightMargin: 5
        anchors.bottomMargin: 0
        font.pixelSize: 18
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.NoWrap
        cursorVisible: true

        onEditingFinished: settings.meal4Name = text
    }

    Text {
        id: meal5
        x: 22
        color: "#ffffff"
        text: qsTr("Meal 5 Name:")
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.leftMargin: 19
        anchors.topMargin: 220
        font.pixelSize: 20
        font.underline: true
        font.bold: false
    }

    TextField {
        id: meal5Name
        y: 256
        height: 35
        color: "#ffffff"
        text: qsTr(settings.meal5Name)
        anchors.left: meal5.right
        anchors.right: parent.right
        anchors.bottom: meal5.top
        anchors.leftMargin: 22
        anchors.rightMargin: 5
        anchors.bottomMargin: -28
        font.pixelSize: 18
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.NoWrap
        cursorVisible: true

        onEditingFinished: settings.meal5Name = text
    }
}
