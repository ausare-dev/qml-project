import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "statusEnum.js" as StatusEnum
Page {
    id: page3
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
                text: "Статус системы"
                font.pointSize: 14
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: stackView.push(Qt.resolvedUrl("HomePage.qml"))
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
                text: "Cтатус элементов:"
                font.pointSize: 16
            }
            Rectangle {
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                color: "white"
                border.color: "#ADD8E6"
                clip: true;
                Rectangle {
                    anchors.margins: 10
                    color: "white"
                    anchors.fill: parent



                    ScrollView {
                        anchors.fill: parent
                                        contentWidth: parent.width
                                        // contentHeight: parent.height
                                        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                        Column {
                            width: parent.width

                            Row {
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 3
                                width: parent.width

                                Rectangle {
                                    height: 40

                                    width: parent.width/4
                                    color: "#ADD8E6"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Сбой"
                                        font.pointSize: 14
                                        color: "white"
                                    }
                                }
                                Rectangle {
                                    height: 40
                                    width: parent.width/7

                                    color: "#ADD8E6"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Дата/время"
                                        font.pointSize: 14
                                        color: "white"
                                    }
                                }
                                Rectangle {
                                    height: 40
                                    width: parent.width/5

                                    color: "#ADD8E6"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Вероятность"
                                        font.pointSize: 14
                                        color: "white"
                                    }
                                }
                                Rectangle {
                                    height: 40
                                    width: parent.width/5

                                    color: "#ADD8E6"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Статус"
                                        font.pointSize: 14
                                        color: "white"
                                    }
                                }
                                Rectangle {
                                    height: 40

                                    width: parent.width/4.9

                                    color: "#ADD8E6"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Посл. обн. статуса"
                                        font.pointSize: 14
                                        color: "white"
                                    }
                                }

                            }

                            Repeater {
                                model: microphoneModel
                            Rectangle {
                                width: parent.width
                                height: 55
                                border.color: "#ADD8E6"
                                Row {
                                    spacing: 3
                                    width: parent.width
                                    Rectangle {
                                        width: parent.width/4
                                       height: 55
                                        color: "transparent"
                                        border.color: "transparent"
                                        Text {
                                            text: {
                                                return "Микрофон №" + model.microphone + "\n" + model.analysisDevice.split('№')[0]
                                            }
                                            font.pointSize: 13
                                            leftPadding: 20
                                        }
                                    }
                                    Rectangle {
                                        width: parent.width/7
                                        height: 55
                                        color: "transparent"
                                        border.color: "transparent"
                                        Text {
                                            text: {
                                                return model.datetime.split(' ')[0] + '\n' + model.datetime.split(' ')[1];
                                            }
                                            font.pointSize: 13
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Rectangle {
                                        width: parent.width/5
                                        height: 55


                                        color: "transparent"
                                        border.color: "transparent"

                                        Row {
                                            leftPadding: 50
                                           anchors.verticalCenter: parent.verticalCenter



                                            spacing: 20

                                            Image {

                                                id: status
                                                source: model.probability.split('%')[0] > 60 ? "statusHeight.svg" : model.probability.split('%')[0] > 30 ? "statusMedium.svg" : "statusLow.svg"
                                                height: 40
                                                width: 40

                                            }
                                            Text {

                                                    text: model.probability.split('%')[0] > 60 ? "Высокий" : model.probability.split('%')[0] > 30 ? "Средний" : "Низкий"
                                                    font.pointSize: 13
                                                     anchors.verticalCenter: parent.verticalCenter


                                                }
                                        }


                                    }
                                    Rectangle {
                                        width: parent.width/5
                                       height: 55
                                       color: "transparent"
                                       border.color: "transparent"
                                        Text {
                                            text: model.failureStatus
                                            anchors.centerIn: parent
                                            font.pointSize: 13
                                        }
                                    }
                                    Rectangle {
                                        width: parent.width/4.9
                                        height: 55
                                        color: "transparent"
                                        border.color: "transparent"
                                        Text {
                                            text: {
                                                return model.lastUpdate.split(' ')[0] + '\n' + model.lastUpdate.split(' ')[1];

                                            }
                                            font.pointSize: 13
                                            anchors.centerIn: parent
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
