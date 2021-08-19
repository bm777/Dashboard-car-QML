import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.8
    height: 30
    radius: 2
    color: "#30000000"
    property string label: "Firstname and Lastname"
    property string value: ""

    Text {
        text: label
        color: "#50ffffff"
        font{family: "Comfortaa"; pointSize: 10}
        y: -height * 1.1
        x: 2
    }
    TextField {
        id: field
        anchors.verticalCenter: parent.verticalCenter
//        placeholderText: placeholder
        width: parent.width
        text: value
        color: "#30ffffff"
        maximumLength: 40
        hoverEnabled: true
        font{family: "Comfortaa"; pointSize: 8}
        background: Rectangle {
            color: "transparent"
        }
    }
}
