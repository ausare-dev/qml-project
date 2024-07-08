import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "statusEnum.js" as StatusEnum
Page {
    id: page2
    padding: 15
    property var microphoneData
    background: Rectangle {
                color: "white"
            }
    ColumnLayout {
        anchors.fill: parent
        spacing: 30

        RowLayout {
            spacing: 20

            Text {
                text: "Текущий статус системы:"
                font.pointSize: 16
            }

            Rectangle {
                height: 30
                width: 200
                color: "#ADD8E6"

                Text {
                    anchors.centerIn: parent
                    text: StatusEnum.getStatusText(StatusEnum.StatusEnum.Running)
                    font.pointSize: 16
                    font.bold: true
                    color: "white"
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 30
            Text {
                            text: "Статус элементов:"
                            font.pointSize: 16
                        }
            Rectangle {
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                border.color: "#ADD8E6"
                Rectangle {
                    anchors.margins: 10
                    color: "#F0F0F0"
                    anchors.fill: parent
                    Row {
                        spacing: 10
                        anchors.right: parent.right;
                        rightPadding: 15
                        topPadding: 15
                    Text {

                        text: {
                            if (microphoneData.status !== "Микрофон не подключен") {
                                return "Последний сбой был зафиксирован: " + microphoneData.lastUpdate;
                            } else {
                                return "Последний сбой был зафиксирован: неизвестно";
                            }
                        }
                        font.pointSize: 14
                    }

                    Button {
                                    width: 40
                                    height: 40
                                    icon.name: "close"
                                    icon.source: "close.svg"
                                    icon.color: "#ADD8E6"
                                    background: Rectangle {
                                        color: "white"
                                        border.color: "#ADD8E6"
                                    }
                                    MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                stackView.push(Qt.resolvedUrl("HomePage.qml"))
                                            }
                                        }
                                    Layout.alignment: Qt.AlignVCenter
                                }
                    }
                    Item {
                        anchors.fill: parent
                        anchors.margins: 20

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: 30
                    Text {
                        text: "Микрофон " + microphoneData.microphone + ": " + microphoneData.type
                        font.pointSize: 14
                    }
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: 10
                    Row {
                        spacing: 20

                    Image {
                        source: {
                            switch (microphoneData.status) {
                                case "Работает нормально":
                                    return "work.svg";
                                case "Вероятен сбой":
                                    return "warning.svg";
                                case "Сбой":
                                    return "error.svg";
                                case "Микрофон не подключен":
                                    return "not_work.svg";
                                default:
                                    return "";
                            }
                        }
                        width: 50
                        height: 50
                    }
                    Text {
                        text: microphoneData.status
                        font.pointSize: 30
                        font.bold: true;
                    }
                    }

                    Text {
                        text: {
                            if (microphoneData.status !== "Микрофон не подключен") {
                                return "Вероятность сбоя - " + microphoneData.probability;
                            } else {
                                return "Вероятность сбоя - неизвестно";
                            }
                        }
                        font.pointSize: 14
                    }
                    }
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: 1
                    Text {
                        text: "Присвоенное устройство для анализа: " + microphoneData.analysisDevice
                        font.pointSize: 14
                        leftPadding: 30
                    }
                    Row {

                        spacing: 150
                    Image {
                        source: "src/img/imge.png"
                    }
                    ColumnLayout {
                        anchors.verticalCenter: parent.verticalCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    Button {
                        id: playButton
                        icon.name: "play"
                        icon.source: "play.svg"
                        icon.color: "#ADD8E6"
                        icon.height: 50
                        icon.width: 50

                        background: Rectangle {
                            id: buttonBackground
                            color: "white"
                            border.color: "#ADD8E6"
                        }
                         Layout.alignment: Qt.AlignHCenter
                         property bool isClicked: false
                         MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            playButton.isClicked = !playButton.isClicked
                                            if (playButton.isClicked) {
                                                buttonBackground.color = "#ADD8E6"
                                                playButton.icon.color = "white"
                                                buttonBackground.border.color = "white"
                                            } else {
                                                buttonBackground.color = "white"
                                                playButton.icon.color = "#ADD8E6"
                                                buttonBackground.border.color = "#ADD8E6"
                                            }
                                        }
                                    }
                    }


                        Text {
                            text: "Прослушать звук"
                            font.pointSize: 16
                        }


                    }
                    }
                    }




                }
                    }

                }
            }

        }


    }
}
