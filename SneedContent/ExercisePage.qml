

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Sneed
import QtQuick.Layouts

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"

    Text {
        color: "#ffffff"
        text: "Exercises"
        anchors.top: parent.top
        anchors.topMargin: 10
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        font.family: Constants.largeFont.family
    }

    RoundButton {
        id: add

        x: 415
        width: 50
        height: 50
        text: "+"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 15
        anchors.topMargin: 7
        font.bold: true
        font.pointSize: 30

        onClicked: model.append({"name": ""})
    }

    ScrollView {
        id: scrollView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: add.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0


        ListView {
            id: listView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: add.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 8
            anchors.bottomMargin: 0

            model: ListModel {
                id: model

                ListElement {
                    name: "test"
                }
            }
            delegate: Exercise { }
        }
    }
}
