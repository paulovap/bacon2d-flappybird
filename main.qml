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

    Scene{
        id:scene
        width: parent.width; height:parent.height
        physics: true
        gravity: Qt.point(0,9.8)
        pixelsPerMeter:18
        Component.onCompleted: scene.running = false

        running:false

        Rectangle{
            anchors.fill: parent
            color:"#4ec0ca"
        }

        InfiniteScrollItem{
            id:scrollItem
            anchors{
                bottom:parent.bottom; bottomMargin: floor.height;
                horizontalCenter: parent.horizontalCenter}
            Image{
                scale:1
                width:scene.width
                source: "img/sky.png"
                fillMode: Image.Tile
                Timer{
                    running:scene.running
                    interval: 16
                    repeat: true
                    onTriggered: scrollItem.offsetX +=0.02
                }
            }
        }

        Birdy{
            id:bird
            x:200; y:200;
        }

        DoublePipe{
            id:dp
            bodyX:scene.width + 10
            onTouched: scene.running = false
            //updateInterval: 16

            Timer{
                running:scene.running
                interval: 16
                repeat: true
                onTriggered: dp.bodyX-= 1.5
            }

            height: parent.height
            gapY: 100
            gapHeight: 100
        }

        Floor{
            id:floor
            width: parent.width
            height:112
            anchors.left: scene.left
            anchors.bottom: scene.bottom
            scene: scene
        }

        Keys.onUpPressed: {
            bird.jump()
        }
    }

}

