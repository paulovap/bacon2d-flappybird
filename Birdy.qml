/* Birdy.qml
 *
 * Copyright (C) 2014 Paulo Pinheiro
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 */

import QtQuick 2.3
import Bacon2D 1.0

Entity{
    id:root
    width:60;height:50
    transformOrigin: Item.TopLeft


    BoxBody{
        id:circleBody
        world: root.scene.world
        target: root
        width: root.width - 20
        height: root.height - 20
        density: 0.5
        friction: 1
        restitution: 0.2
        fixedRotation: true
        bodyType: Body.Dynamic
    }

    function jump(){
        state = "jumping"
        var oldVel = circleBody.linearVelocity
        circleBody.linearVelocity = Qt.point(oldVel.x, -4)
    }

    Sprite {
        id: birdy
        anchors.fill: parent
        spriteState: scene.running ? Bacon2D.Running : Bacon2D.Paused
        property bool jumping: false

        animation:  "flying"

        states: [
            State {
                name: "jumping"
                PropertyChanges {
                    target: birdy
                    jumping:true

                }
            }
        ]

        animations: [
            SpriteAnimation {
                name: "flying"
                source: "img/bird_sprite.png"
                frames: 3
                duration: 400
                loops: Animation.Infinite
            }
        ]
    }
}
