import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "statusEnum.js" as StatusEnum
Page {
    id: page1
    padding: 15;
    background: Rectangle {
                color: "white"
            }
    Rectangle {
        width: 200
        height: 30
        color: "#ADD8E6"
        anchors.right: parent.right;
        Text {
            anchors.centerIn: parent
            text: "История сбоев"
            font.pointSize: 14
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stackView.push(Qt.resolvedUrl("HistoryFailurePage.qml"))
        }
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
        Text {
            id: test
            text: "Cтатус элементов:"
            font.pointSize: 16
        }
        Rectangle {


                Layout.fillHeight: true;
                 Layout.fillWidth: true;

            border.color: "#ADD8E6"
            clip: true;
            ScrollView {
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                height: parent.height
                width: parent.width

                contentWidth: parent.width
                contentHeight: {
                    if (microphoneModel.count % 2 === 0) {
                                           return 143 * microphoneModel.count
                                       } else {
                                           return 143 * (microphoneModel.count + 1)
                                       }
                }

            GridLayout {
                id: grid
                columns: 2
                anchors.fill: parent
                anchors.margins: 10

                Repeater {
                    model: microphoneModel
                    anchors.top: parent.top
                    Item {
                        Layout.minimumWidth: grid.width / grid.columns - 5

                        height: 277
                        Rectangle {
                            anchors.fill: parent
                            anchors.top: parent.top
                            color: {
                                    switch (model.status) {
                                        case "Работает нормально":
                                            return "lightgreen";
                                        case "Вероятен сбой":
                                            return "yellow";
                                        case "Сбой":
                                            return "red";
                                        case "Микрофон не подключен":
                                            return "lightgray";
                                        default:
                                            return "lightgray";
                                    }
                                }
                            MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        stackView.push(Qt.resolvedUrl("MicrophoneDetailsPage.qml"), { microphoneData: model })
                                    }
                                }
                            Item {
                                anchors.fill: parent
                                anchors.margins: 20
                            Column {
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width
                                spacing: 30
                                Text {
                                    text: {
                                        if (model.status !== "Микрофон не подключен") {
                                            return "Микрофон " + model.microphone + ": " + model.type;
                                        } else {
                                            return "Микрофон " + model.microphone + ": " + "не подключен";
                                        }
                                    }
                                    font.pointSize: 14
                                }
                                Column {
                                    spacing: 10;
                                    Row {
                                        spacing: 20
                                        Image {
                                            width: 40
                                            height: 40
                                            source: {
                                                switch (model.status) {
                                                    case "Работает нормально":
                                                        return "src/icon/work.svg";
                                                    case "Вероятен сбой":
                                                        return "src/icon/warning.svg";
                                                    case "Сбой":
                                                        return "src/icon/error.svg";
                                                    case "Микрофон не подключен":
                                                        return "src/icon/not_work.svg";
                                                }
                                            }
                                        }
                                        Text {
                                            text: model.status
                                            font.pointSize: 20
                                            font.bold: true
                                        }
                                    }
                                    Text {
                                        text:  {
                                                if (model.status !== "Микрофон не подключен") {
                                                    return "Вероятность сбоя - " + model.probability;
                                                } else {
                                                    return "Вероятность сбоя неизвестна";
                                                }
                                        }
                                        font.pointSize: 14;
                                    }
                                }
                                Text {
                                    text: "Присвоенное устройство для анализа: " + model.analysisDevice
                                    font.pointSize: 14;
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }}
                        }
                    }
                }}
            }
        }
    }
    Component.onCompleted: {
            var request = new XMLHttpRequest()
            request.open('GET', 'http://127.0.0.1:8000/api/microphones')
            request.onreadystatechange = function() {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
                        microphoneModel.clear()
                        var response = JSON.parse(request.responseText)
                        for (var i = 0; i < response.length; i++) {
                            microphoneModel.append(response[i])
                        }
                    } else {
                        console.log('Failed to load data')
                    }
                }
            }
            request.send()
        }

    ListModel {
        id: microphoneModel
    }
}
