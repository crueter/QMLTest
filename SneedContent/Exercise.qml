

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: exercise

    // property string name

    width: parent.width
    height: 400
    color: "#000000"

    RoundButton {
        id: remove
        width: 52
        height: 51
        text: "x"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.topMargin: 8
        topPadding: 5
        font.pointSize: 24
        flat: false
    }

    TextField {
        id: exerciseName

        text: name

        height: 56
        anchors.left: remove.right
        anchors.right: add.left
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 8
        font.pointSize: 20
        placeholderText: qsTr("Exercise Name")

        onEditingFinished: name = text
    }

    RoundButton {
        id: add

        width: 52
        height: 51
        text: "+"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 8
        anchors.topMargin: 8
        topPadding: 10
        font.pointSize: 24
        flat: false

        onClicked: model.append({"reps": 0, "weight": 0})
    }

    ListView {
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: exerciseName.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 8
        anchors.bottomMargin: 0

        model: ListModel {
            id: model
        }
        delegate: ExerciseSet { }
    }
}
