import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    signal newGame()
    signal quitApp()
    property int score: 4;
    Button {
        id: newGameButton
        text: "New Game"
        onClicked: newGame()
        background: Rectangle {
            color: "#B9AEA0"
            implicitHeight: 40
            implicitWidth: 100
            radius: 7
        }
    }
    Rectangle {
        height: 60
        width: 390
        color: "#FAF8EF"
        TextArea {
            text: score
            font.family: "Impact"
            font.pointSize: 20
            color: "#B9AEA0"
            anchors.centerIn: parent
            selectByMouse: false
            readOnly: true
            id: scoreField

        }
    }

    Button {
        id: quitButton
        text: "Quit"
        onClicked: quitApp()
        background: Rectangle {
            color: "#B9AEA0"
            implicitHeight: 40
            implicitWidth: 100
            radius: 7
        }
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Ctrl+N"]
        onActivated: newGame()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: [StandardKey.Close, "Ctrl+Q"]
        onActivated: quitApp()
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Left"]
        onActivated: gameplay.goleft()
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Right"]
        onActivated: gameplay.goright()
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Up"]
        onActivated: gameplay.gotop()
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Down"]
        onActivated: gameplay.gobottom()
    }

}
