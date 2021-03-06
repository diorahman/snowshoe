import QtQuick 2.0

import "UiConstants.js" as UiConstants

Item {
    id: root
    property alias verticalAlignment: input.verticalAlignment
    property alias text: input.text
    property alias input: input
    signal accepted()

    Rectangle {
        anchors.fill: root
        color: "#fff"
    }

    BorderImage {
        id: border
        source: ":/mobile/url/border"
        border { left: 25; top: 25; right: 25; bottom: 25 }
        anchors.fill: root
    }

    TextInput {
        id: input
        anchors { fill: root; leftMargin: 15; rightMargin: 60 }
        font.pixelSize: UiConstants.DefaultFontSize
        font.family: UiConstants.DefaultFontFamily
        font.weight: Font.Light
        color: UiConstants.PrimaryColor
        clip: true
        text: ""
        inputMethodHints: Qt.ImhNoPredictiveText

        onFocusChanged: if (!focus) closeSoftwareInputPanel()
        onAccepted: root.accepted()

        Text {
            id: textHint
            text: "Go to web address or search..."
            color: "#9e9e9e"
            font.pixelSize: UiConstants.DefaultFontSize
            font.family: UiConstants.DefaultFontFamily
            font.weight: Font.Light
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.verticalCenter: input.verticalCenter
            visible: input.text == ""
        }
    }
}
