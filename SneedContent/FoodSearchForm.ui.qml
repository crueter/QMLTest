

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
    width: 480
    height: 640
    color: "#000000"

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
}
