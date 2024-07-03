import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "data.js" as DataModel

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: "СПО \"СПАД\""
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
