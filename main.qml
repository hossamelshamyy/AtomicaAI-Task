import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 600
    height: 600
    visible: true
    title: qsTr("Atomica.ai")
    property variant buttonsArray: ["Start", "Settings", "Quit"]

    Image{
        id: backgroundImg
        source: "images/background"
        width: parent.width
        height: parent.height/1.4
        antialiasing: true
    }

    Image{
        id: atomicaImg
        anchors.top: backgroundImg.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: backgroundImg.horizontalCenter
        visible: true
        source: "images/atomica"
        width: backgroundImg.width / 3
        height: backgroundImg.height/4
        antialiasing: true

    }

    Rectangle{
        id: rec
        anchors.top: backgroundImg.bottom
        anchors.margins: 25
        anchors.bottom: parent.bottom
        // To avoid code redundancy RepeaterModel is used
        Column{
            anchors.top: rec.top
            anchors.bottom: rec.bottom
            anchors.left: rec.left
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            spacing: 0
            Repeater {
                model: 3
                delegate: CustomButton {
                    required property int index
                    text: buttonsArray[index]
                    duration: 300
                }
            }
        }
    }
}
