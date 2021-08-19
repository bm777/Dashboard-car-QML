import QtQuick 2.13
import QtQuick.Window 2.13
import QtGraphicalEffects 1.15


Window {
    id: root
    title: "kira"
    width: 1024
    height: 600
    visible: true

    property color degraded: "#05a3e3"
    property real inter_velo: 0
    property real inter_rpm: 0

    Behavior on inter_velo {
        NumberAnimation {duration: 100}
    }
    Behavior on inter_rpm {
        NumberAnimation {duration: 100}
    }


    Rectangle {
        anchors.fill: parent
        color: "#161616"
    }
    ////////////////////////////////////////////////////////////////////////////
    Item {
        id: dashboard
        anchors.fill: parent
        visible: load.opacity === 0 ? true : false


        Image {
            source: "img/control.png"
            width: 30
            height: width
            y: 10
            x: 30
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pop.visible = true
                }
            }
        }


        Item {
            id: main
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.3
            height: parent.height

            Glow {
                anchors.fill: car
                radius: 8
                samples: 17
                color: "#40ffffff"
                source: car
            }

            Image {id: car
                source: "img/car.png"
                width: parent.width * 0.5
                height: 1255 * width/600
                anchors.centerIn: parent
                smooth: true
            }
        }

        ///////////////////////////////////////////////////////////////////////////////
        Batery {
            id: bat
            x: parent.width - width * 2
            y: 10
            value: 0.9
        }

        ///////////////////////////////////////////////////////////////////////////////

        ////
        Item {
            id: left
            width: (parent.width - main.width)/2
            height: parent.height
            //////////////////////////////////////////////////////////
            // TOP
            Text {id: temp_inside
                text: "29"
                font{family: "Comfortaa"; pointSize: 50}
                x: parent.width * 0.6
                y: parent.height * 0.25
                color: degraded
            }
            Text {
                text: "°C"
                font{family: "Comfortaa"; pointSize: 25}
                x: temp_inside.x + temp_inside.width + 10
                y: parent.height * 0.26
                color: degraded
            }
            Rectangle {
                height: 2
                width: parent.width * 0.35
                x: temp_inside.x + width * 0.7
                y: parent.height * 0.37
            }
            Text {
                text: "Température ambiante"
                font{family: "Comfortaa"; pointSize: 12}
                x: temp_inside.x - width * 0.1
                y: parent.height * 0.4
                color: "#80ffffff"
            }
            //////////////////////////////////////////////////////////
            // bottom
            Text {id: velocity
                text: Math.round(inter_velo)
                font{family: "Comfortaa"; pointSize: 50}
                x: parent.width * 0.6
                y: parent.height * 0.7
                color: degraded


            }
            Text {id: ms
                text: "m/s"
                font{family: "Comfortaa"; pointSize: 25}
                x: velocity.x + velocity.width + 10
                y: parent.height * 0.71
                color: degraded
            }
            Rectangle {
                height: 2
                width: parent.width * 0.35
                x: velocity.x + width * 0.72
                y: parent.height * 0.69
            }
            Text {
                text: "Vitesse"
                font{family: "Comfortaa"; pointSize: 12}
                x: velocity.x + (velocity.width)/2 - width/2
                y: parent.height * 0.85
                color: "#80ffffff"

            }
        }

        /////
        Item {
            id: right
            width: (parent.width - main.width)/2
            height: parent.height
            x: main.x + main.width
            //////////////////////////////////////////////////////////////////
            // TOP
            Text {id: rmp
                text: Math.round(inter_rpm)
                font{family: "Comfortaa"; pointSize: 50}
                x: parent.width * 0.1
                y: parent.height * 0.25
                color: degraded

            }
            Text {
                text: "tr/min"
                font{family: "Comfortaa"; pointSize: 25}
                x: rmp.x + rmp.width + 10
                y: parent.height * 0.26
                color: degraded
            }
            Rectangle {
                height: 2
                width: parent.width * 0.35
                x: - width * 0.55
                y: parent.height * 0.37
            }
            Text {
                text: "RPM"
                font{family: "Comfortaa"; pointSize: 12}
                x: rmp.x + rmp.width * 0.5 - width/2
                y: parent.height * 0.4
                color: "#80ffffff"
            }

            //////////////////////////////////////////////////////////////////////
            // // BOTTOM
            Text {id: temp_motor
                text: "38"
                font{family: "Comfortaa"; pointSize: 50}
                x: parent.width * 0.1
                y: parent.height * 0.7
                color: degraded
            }
            Text {id: c
                text: "°C"
                font{family: "Comfortaa"; pointSize: 25}
                x: temp_motor.x + temp_motor.width + 10
                y: parent.height * 0.71
                color: degraded
            }
            Rectangle {
                height: 2
                width: parent.width * 0.35
                x: -width * 0.55
                y: parent.height * 0.69
            }
            Text {
                text: "Température du moteur"
                font{family: "Comfortaa"; pointSize: 12}
                x: temp_motor.x + (temp_motor.width+c.width )* 0.5 - width/2
                y: parent.height * 0.85
                color: "#80ffffff"
            }
        }
        Behavior on visible {

            NumberAnimation {
                target: dashboard
                property: "width"
                from: 0
                to: root.width
                duration: 2000
                easing.type: Easing.InOutQuad
            }
        }
        RectangularGlow {
            anchors.fill: pop
            glowRadius: 10
            spread: 0.2
            color: "#8005a3e3"
            cornerRadius: pop.radius + glowRadius
            visible: pop.visible
}

        Rectangle {
            id: pop
            width: parent.width * 0.4
            height: parent.height * 0.8
            color: "#161616"
            visible: false
            anchors.centerIn: parent
//            border.color: "#80ffffff"


            /////
            Rectangle {
                width: parent.width
                height: parent.height * 0.25
                color: "#000000"
//                border.color: "#80ffffff"
                Image {
                    id: user_infos
                    source: "img/user-infos.png"
                    anchors.centerIn: parent
                    width: 48
                    height: width
                }
            }
            Rectangle {
                width: 40
                height: width
                color: "black"
                x: parent.width - width
                Text {
                    text: qsTr("x")
                    font{family: "Comfortaa"; pointSize: 25}
                    color: "white"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: pop.visible = false
                }
            }
            Field {
                id: first_last_name
                y: parent.height * 0.35
                label: "Firstname and Lastname"
                value: "Abomo Jean"
            }
            Field {
                id: tel
                y: parent.height * 0.48
                label: "Téléphone"
                value: "(+237)658476259"
            }
            Field {
                id: adr
                y: parent.height * 0.61
                label: "Adresse"
                value: "Ngoa Ekele"
            }
            Field {
                id: email
                y: parent.height * 0.74
                label: "Email"
                value: "abomo.jean@gmail.com"
            }

        }
    }

    ///////////////////////////////////////////////////////////////////////::////
    Item {
        id: load
        width: parent.width
        height: parent.height
        visible: !dashboard.visible

        Rectangle {
            anchors.fill: parent
            color: "black"
        }

        AnimatedImage {
            id: gif
            source: "img/animation.gif"
            anchors.centerIn: parent

        }
        Rectangle {
            width: content.width * 1.1
            height: content.height * 1.5
            y: parent.height * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "#6a379d"
            color: "black"
            Text {id: content
                text: "Bonjour, Je suis Kira, votre assistant developpé
par GeBox en parténariat avec la NAFMO
automobile industrie."
                anchors.horizontalCenter: parent.horizontalCenter
                y: parent.height * 0.2
                color: "#ffffff"
                font{family: "Comfortaa"; }
            }
        }

    }


    //////////////////////////////////////////////////////////////////////////////

    ParallelAnimation {
        running: dashboard.visible
        loops: Animation.Infinite

        SequentialAnimation {
            ParallelAnimation {
                NumberAnimation {
                    target: root
                    property: "inter_velo"
                    from: 0
                    to: 40
                    duration: 5000
                }
                NumberAnimation {
                    target: root
                    property: "inter_rpm"
                    from: 0
                    to: 300
                    duration: 5000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: root
                    property: "inter_velo"
                    to: 36
                    duration: 1000
                }
                NumberAnimation {
                    target: root
                    property: "inter_rpm"
                    to: 210
                    duration: 1000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: root
                    property: "inter_velo"
                    to: 70
                    duration: 6000
                }
                NumberAnimation {
                    target: root
                    property: "inter_rpm"
                    to: 997
                    duration: 6000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: root
                    property: "inter_velo"
                    to: 0
                    duration: 6000
                }
                NumberAnimation {
                    target: root
                    property: "inter_rpm"
                    to: 0
                    duration: 6000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: root
                    property: "inter_velo"
                    to: 0
                    duration: 6000
                }
                NumberAnimation {
                    target: root
                    property: "inter_rpm"
                    to: 0
                    duration: 6000
                }
            }
        }
    }

    //////////////////////////////////////////////////////////////////////////////////:
    ParallelAnimation {
        running: dashboard.visible
        loops: Animation.Infinite

        SequentialAnimation {
            PropertyAnimation {
                target: root
                property: "degraded"
                from: "#05a3e3"
                to: "#6a379d"
                duration: 5000
            }

            PropertyAnimation {
                target: root
                property: "degraded"
                to: "#9b4389"
                duration: 5000
            }
            PropertyAnimation {
                target: root
                property: "degraded"
                to: "#05a3e3"
                duration: 3000
            }

        }
    }

    SequentialAnimation {
        running: load.visible

        PropertyAnimation {
            target: content
            property: "text"
            to: "Nous allons faire un checkup  du système"
            duration: 3000
        }
        PropertyAnimation {
            target: content
            property: "text"
            to: "Nous allons faire un checkup  du système"
            duration: 3000
        }
        ParallelAnimation {
//            NumberAnimation {
//                target: load
//                property: "x"
//                from: 0
//                to: -root.width
//                duration: 1000
//            }
            PropertyAnimation {
                target: load
                property: "opacity"
                to: 0
                duration: 1000
            }
        }
    }
}
