import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Item {
    id:root
    width: 300
    height: 400

    property string score: ""
    property string highScore: ""

    ColumnLayout{
        Text {
            id: text
            text: qsTr("Game Over")
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28

        }

        Text {
            id: text1
            text:root.score
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
        }

        Text {
            id: text2
            text: "High Score"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
        }

        Text {
            id: text3
            text: root.highScore
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
        }

    }
}
