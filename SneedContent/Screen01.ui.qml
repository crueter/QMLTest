

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Sneed
// import SneedTest

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
        id: setting1
        x: 22
        color: "#ffffff"
        text: qsTr("Test Setting:")
        anchors.top: title.bottom
        anchors.topMargin: 20
        font.pixelSize: 20
        anchors.horizontalCenterOffset: -156
        anchors.horizontalCenter: parent.horizontalCenter
        font.underline: true
        font.bold: false
    }

    // Settings {
    //     id: settings
    // }

    Frame {
        id: frame
        clip: true
        y: 63
        width: 310
        height: 28
        anchors.left: setting1.right
        anchors.bottom: setting1.bottom
        anchors.leftMargin: 15
        anchors.bottomMargin: 0

        TextInput {
            id: setting1Edit
            width: 310
            height: 20
            color: "#ffffff"
            text: qsTr(settings.setting1)
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            wrapMode: Text.NoWrap
            anchors.verticalCenterOffset: 3
            anchors.horizontalCenterOffset: 5
            anchors.horizontalCenter: parent.horizontalCenter

            onTextChanged: settings.setting1 = text
        }
    }
}
