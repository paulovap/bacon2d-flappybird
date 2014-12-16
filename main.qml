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
        debug:true
        Rectangle{
            anchors.fill: parent
            color:"#4ec0ca"
        }

        Image{
           width:parent.width
           scale:1
           anchors{
               bottom:parent.bottom; bottomMargin: floor.height;
               horizontalCenter: parent.horizontalCenter}
           source: "img/sky.png"
           fillMode: Image.Tile
        }

//        Pipe{
//            x:50;y:50;
//            height: 200
//            headUp: true
//        }

        Birdy{
            id:bird
            x:100; y:-100;
            clip:true
            world: scene.world
        }
        Floor{
            id:floor
            width: parent.width
            height:112
            anchors.left: scene.left
            anchors.bottom: scene.bottom
            world: scene.world
            scene:scene
            onTouchedFloor: console.log("Touched" + other)
        }

        Keys.onUpPressed: {
            bird.jump()
        }
    }

}

