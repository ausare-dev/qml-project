import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "statusEnum.js" as StatusEnum
import "constants.js" as Colors
Page {
    id: page3
    padding: 15;
    background: Rectangle {
                color: Colors.theme.bgColor
            }
    Rectangle {
            width: 200
            height: 30
            color: Colors.theme.primaryColor
            anchors.right: parent.right;
            Text {
                anchors.centerIn: parent
                text: "Статус системы"
                font.pointSize: 14
                color: Colors.theme.bgColor
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
                    color: Colors.theme.primaryColor

                    Text {
                        anchors.centerIn: parent
                        text: StatusEnum.getStatusText(StatusEnum.StatusEnum.Running)
                        font.pointSize: 16
                        font.bold: true
                        color: Colors.theme.bgColor
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
                color: Colors.theme.bgColor
                border.color: Colors.theme.primaryColor
                clip: true;
                Rectangle {
                    anchors.margins: 10
                    color: Colors.theme.bgColor
                    anchors.fill: parent



                    ScrollView {
                        anchors.fill: parent
                                        contentWidth: parent.width

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
                                    color: Colors.theme.primaryColor
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Сбой"
                                        font.pointSize: 14
                                        color: Colors.theme.bgColor
                                    }
                                }
                                Rectangle {
                                    height: 40
                                    width: parent.width/7

                                    color: Colors.theme.primaryColor
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Дата/время"
                                        font.pointSize: 14
                                        color: Colors.theme.bgColor
                                    }
                                }
                                Rectangle {
                                    height: 40
                                    width: parent.width/5

                                    color: Colors.theme.primaryColor
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Вероятность"
                                        font.pointSize: 14
                                        color: Colors.theme.bgColor
                                    }
                                }
                                Rectangle {
                                    height: 40
                                    width: parent.width/5

                                    color: Colors.theme.primaryColor
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Статус"
                                        font.pointSize: 14
                                        color: Colors.theme.bgColor
                                    }
                                }
                                Rectangle {
                                    height: 40

                                    width: parent.width/4.9

                                    color: Colors.theme.primaryColor
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Посл. обн. статуса"
                                        font.pointSize: 14
                                        color: Colors.theme.bgColor
                                    }
                                }

                            }

                            Repeater {
                                model: microphoneModel
                            Rectangle {
                                width: parent.width
                                height: 55
                                border.color: Colors.theme.primaryColor
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
                                                source: model.probability.split('%')[0] > 60 ? "src/icon/statusHeight.svg" : model.probability.split('%')[0] > 30 ? "src/icon/statusMedium.svg" : "src/icon/statusLow.svg"
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
