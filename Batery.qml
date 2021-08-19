import QtQuick 2.0

Rectangle {
    width: 60
    height: 30
    radius: 3
    color: "transparent"
    border.color: "#05a3e3"
    property real value: 0.7
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: 3
        height: parent.height/2
        x: -width//2
        radius: width/2
        color: "#05a3e3"
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * 0.8
        width: parent.width * 0.9
        color: "transparent"

        Rectangle {
            height: parent.height
            width: parent.width * value
            color: "#05a3e3"
            x: parent.width - width
        }
    }
    Text {
        text: qsTr(Math.round(value * 100) + "%")
        font{family: "Comfortaa"; pointSize: 10; bold: true}
        x: -parent.width *0.25 - width
        anchors.verticalCenter: parent.verticalCenter
        color: "#05a3e3"
    }
}
