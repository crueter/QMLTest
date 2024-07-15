import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 480
    height: 100

    Text {
        id: text1
        color: "#ffffff"
        text: qsTr("01/01/2024")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 22
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
