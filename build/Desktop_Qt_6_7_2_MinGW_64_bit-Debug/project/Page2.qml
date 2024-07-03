import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: page2
    padding: 15
    property var microphoneData

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

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
                    text: "Запущена"
                    font.pointSize: 16
                    font.bold: true
                    color: "white"
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter

            Text {
                text: "Микрофон " + microphoneData.microphone + ": " + microphoneData.type
                font.pointSize: 14
            }

            Text {
                text: microphoneData.status
                font.pointSize: 14
            }

            Text {
                text: "Вероятность сбоя - " + microphoneData.probability
                font.pointSize: 14
            }

            Image {
                source: {
                    switch (microphoneData.status) {
                        case "Работает нормально":
                            return "path/to/work.svg";
                        case "Вероятен сбой":
                            return "path/to/warning.svg";
                        case "Сбой":
                            return "path/to/error.svg";
                        case "Микрофон не подключен":
                            return "path/to/not_work.svg";
                        default:
                            return "";
                    }
                }
                width: parent.width * 0.8
                height: 200
            }

            Button {
                text: "Прослушать звук"
                Layout.alignment: Qt.AlignHCenter
                // Добавьте логику для прослушивания звука при нажатии на кнопку
            }
        }

        Button {
            text: "Next Page"
            Layout.alignment: Qt.AlignHCenter
            onClicked: stackView.push(Qt.resolvedUrl("Page3.qml"))
        }
    }
}
