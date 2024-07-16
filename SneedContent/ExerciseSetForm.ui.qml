import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: exerciseSetForm

    required property int reps
    required property int weight
    required property int myId

    width: ListView.view.width
    height: 60

    color: "#000000"

    signal deleteSet(int myId)
    signal changed

    property alias remove: remove
    property alias repsEdit: repsEdit
    property alias weightEdit: weightEdit

    // TODO: Swipe to delete ?
    RoundButton {
        id: remove

        width: 52
        height: 51
        text: "x"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.topMargin: 5
        topPadding: 5
        font.pointSize: 24
        flat: false
    }

    Text {
        id: staticText
        width: 57
        height: 51
        color: "#ffffff"
        text: qsTr("Reps:")
        anchors.left: remove.right
        anchors.top: parent.top
        anchors.leftMargin: 4
        anchors.topMargin: 4
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
    }

    SpinBox {
        id: repsEdit

        width: 101
        height: 45
        anchors.left: staticText.right
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.topMargin: 8
        font.pointSize: 15
    }

    Text {
        id: staticText1
        width: 79
        height: 51
        color: "#ffffff"
        text: qsTr("Weight:")
        anchors.left: repsEdit.right
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.topMargin: 4
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
    }

    SpinBox {
        id: weightEdit

        width: 101
        height: 45
        anchors.left: staticText1.right
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.topMargin: 8
        editable: true
        to: 2000
        font.pointSize: 15
    }
}
