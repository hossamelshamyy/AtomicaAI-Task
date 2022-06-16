import QtQuick 2.15

// Our Button consits of two parts
// Indicator part which is the red rectangle on left
// Text part on right

Item {
    id: root
    required property string text
    required property int duration
    property string lastState: "Normal"
    height: row.height
    width: row.width
// Row layout to align the two parts together
    Row {
        id: row
        spacing: 6
        Rectangle {
            id: buttonIndicator
            height: buttonText.height
            color: "red"
        }
        Text {
            id: buttonText
            text: root.text
            font.pixelSize: 16
            padding: 10
        }
// Input Handlers are used instead of MouseArea and Flickable, because it more efficient, less memory consuming
// and recommended by Qt developers
        HoverHandler {
            onHoveredChanged: {
                state = hovered ? "Hovered" : "Normal"
                lastState = state
            }
        }
        TapHandler {
            onPressedChanged: {
                state = pressed ? "Clicked" : lastState
            }
        }
    }

// Declaring Normal, Hover and Clicked states properties
    states: [
        State {
            name: "Normal"
            when: true
            PropertyChanges {
                target: buttonIndicator;
                width: 10
            }
        },
        State {
            name: "Hovered"
            PropertyChanges {
                target: buttonIndicator;
                width: 25
            }
        },
        State {
            name: "Clicked"
            PropertyChanges {
                target: buttonIndicator;
                width: 30
                color: "green"
            }
        }
    ]
// Declaring the required transition between different states
    transitions: [
        Transition {
            from: "Normal"; to: "Hovered"
            NumberAnimation {
                properties: "width"
                duration: root.duration
                easing.type: Easing.InOutExpo;
            }
        },
        Transition {
            from: "Hovered"; to: "Normal"
            NumberAnimation {
                properties: "width"
                duration: root.duration
                easing.type: Easing.InOutExpo;
            }
        },
        Transition {
            from: "*"
            to: "Clicked"
            NumberAnimation {
                properties: "width"
                duration: root.duration/2
                easing.type: Easing.InOutExpo;
            }
            ColorAnimation { duration: root.duration/2 }

        },
        Transition {
            from: "Clicked"
            to: "*"
            NumberAnimation {
                properties: "width"
                duration: root.duration/2
                easing.type: Easing.InOutExpo;
            }
            ColorAnimation { duration: root.duration/2 }
        }
    ]
}
