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
    height: 360
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

    Scene{
        id:scene
        width: parent.width
        height:parent.height
        physics: true
        gravity: Qt.point(0,9.8)
        pixelsPerMeter:18
        debug: false

        Timer{
            id:timer
            interval:1500
            repeat: true
            running:scene.running
            onTriggered: pipeComponent.createObject(scene,
                                                    {gapY: [120, 125, 130][randomInt(0,3)],
                                                    gapHeight: [120, 125, 130][randomInt(0,3)]})
        }

        Component{
            id:pipeComponent
            Pipe{
                x: parent.width + 20;
                gapY: 120
                gapHeight: 160
                linearVelocity: Qt.point(-4,0)
            }
        }

        Birdy{
             x:250; y:50
            id:bird
            ground: floor.fixture
            onJumpingChanged: {
                console.log("jumping: " + jumping)
            }
            onHit: {
                scene.running = false
                game.state = "over"
            }
        }







       Floor{
           id:floor
       }

        Keys.onUpPressed: {
            bird.jump()
        }

    }

    function randomInt(min, max){
          return Math.floor(Math.random() * (max - min)) + min;
    }

    Text{
        id: textGameOver
        anchors.centerIn: parent
        text: "Game Over!"
        opacity: 0
        visible: true
        font.family: "Arial"
        font.pointSize: 14

        Behavior on scale{
            NumberAnimation{
                easing.type: Easing.OutQuad
                duration:300
            }
        }

    }

}

