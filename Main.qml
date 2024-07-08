import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "data.js" as DataModel

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    minimumWidth: 1111
       minimumHeight: 700
    title: "СПО \"СПАД\""
    Component.onCompleted: {
        microphoneModel.append(DataModel.getMicrophoneData())
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: HomePage { }
        pushEnter: Transition {
                    NumberAnimation {
                        properties: "x"
                        duration: 100
                        from: stackView.width
                        to: 0
                    }
                    NumberAnimation {
                        properties: "opacity"
                        duration: 100
                        from: 0
                        to: 1
                    }
                }

    }

    ListModel {
        id: microphoneModel
    }
}
