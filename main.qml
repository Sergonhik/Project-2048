import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
Window {
    id: w

    visible: true
    minimumWidth: 600
    maximumWidth: 600
    width: 600

    minimumHeight: cl.height
    maximumHeight: cl.height
    height: cl.height
    title: qsTr("2048")

    ColumnLayout {
        id: cl
        anchors.centerIn: w.contentItem
        spacing: 2

        Rectangle{
            color: "#FAF8EF"
            width: 600
            height:60
            Toolbar{
                id: toolbar
                onNewGame: gameplay.newGame()
                onQuitApp: Qt.quit()
            }
        }

        Rectangle {
            color: "#B9AEA0"
            width: 600
            height: 600
            Gameplay {
                id: gameplay

            }
        }
    }
}
