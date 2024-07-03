import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: page3
    padding: 15;

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
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Column {
                width: parent.width

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10

                    Text { text: "Микрофон №"; width: 100 }
                    Text { text: "Тип"; width: 150 }
                    Text { text: "Статус"; width: 150 }
                    Text { text: "Дата/время"; width: 150 }
                    Text { text: "Вероятность"; width: 100 }
                    Text { text: "Последн. обновл. статуса"; width: 200 }
                }

                Repeater {
                    model: microphoneModel

                    Row {
                        spacing: 10
                        width: parent.width
                        Rectangle {
                            width: 100
                            height: 40
                            color: "lightgray"
                            Text {
                                text: model.microphone
                                anchors.centerIn: parent
                            }
                        }
                        Rectangle {
                            width: 150
                            height: 40
                            color: "lightgray"
                            Text {
                                text: model.type
                                anchors.centerIn: parent
                            }
                        }
                        Rectangle {
                            width: 150
                            height: 40
                            color: "lightgray"
                            Text {
                                text: model.status
                                anchors.centerIn: parent
                            }
                        }
                        Rectangle {
                            width: 150
                            height: 40
                            color: "lightgray"
                            Text {
                                text: model.datetime
                                anchors.centerIn: parent
                            }
                        }
                        Rectangle {
                            width: 100
                            height: 40
                            color: "lightgray"
                            Text {
                                text: model.probability
                                anchors.centerIn: parent
                            }
                        }
                        Rectangle {
                            width: 200
                            height: 40
                            color: "lightgray"
                            Text {
                                text: model.lastUpdate
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
        }




    }


}
