/* main.qml
 *
 * Copyright (C) 2014 Paulo Pinheiro
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 */
import QtQuick 2.2
import Bacon2D 1.0

Game{
    id:game
    gameName: "Jumpy Bird"
    width: 640
    height: 420
    ups:30 // <- updates per second
    currentScene: scene

    states: [
        State {
            name: "over"
            PropertyChanges {
                target: textGameOver
                opacity: 1
                scale:2.4
            }
        }
    ]

    MainScene{
        id:scene
        width: parent.width; height:parent.height
    }

    Image{
        source:"img/splash.png"
        visible: !scene.running
        anchors{
            centerIn: parent
            verticalCenterOffset: -20
        }
        z:2
    }
    MouseArea{
        anchors.fill: parent
        onClicked: if(gameState == Bacon2D.Suspended){
                       scene.reset()
                       gameState = Bacon2D.Running
                   }

        z:2
    }
}

