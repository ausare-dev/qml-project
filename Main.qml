import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "data.js" as DataModel

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: "Microphone Status"
    header: Rectangle {
        id: header
        height: 50
        color: "#ADD8E6"
        width: parent.width

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            Layout.alignment: Qt.AlignTop

            Text {
                leftPadding: 30;
                text: "СПО \"СПАД\""
                font.pointSize: 18
                font.bold: true;
                color: "white"
                Layout.alignment: Qt.AlignVCenter
            }

            Rectangle {
                Layout.fillWidth: true
                color: "transparent"
            }

            Button {
                width: 32
                height: 32
                icon.name: "mini"
                icon.source: "mini.svg"
                icon.color: "white"
                onClicked: {
                    Qt.callLater(() => showMinimized())
                }
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }
                Layout.alignment: Qt.AlignVCenter
            }

            Button {
                width: 32
                height: 32
                icon.name: "restore"
                icon.source: "restore.svg"
                icon.color: "white"
                onClicked: {
                    if (visibility === Window.Maximized) {
                        Qt.callLater(() => showNormal())
                    } else {
                        Qt.callLater(() => showMaximized())
                    }
                }
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }
                Layout.alignment: Qt.AlignVCenter
            }

            Button {
                width: 32
                height: 32
                icon.name: "close"
                icon.source: "close.svg"
                icon.color: "white"
                onClicked: {
                    Qt.callLater(() => close())
                }
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
    Component.onCompleted: {
        microphoneModel.append(DataModel.getMicrophoneData())
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Page1 { }
    }

    ListModel {
        id: microphoneModel
    }
}
