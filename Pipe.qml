/* Pipe.qml
 *
 * Copyright (C) 2014 Paulo Pinheiro
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 */

import QtQuick 2.0
import Bacon2D 1.0

PhysicsEntity {
    id:root
    property bool headUp: true

    signal touched(var other)

    width: pipeBody.width

    fixedRotation: true
    bodyType: Body.Static
    //physics
    fixtures:[
        Box{
            id:boxBody
            width: root.width; height: root.height
            density:1
            friction: 1
            sensor:false
            onBeginContact: root.touched(other)
        }

    ]
    Image{
        id:pipeBody
        y: headUp ? imageHead.height : 0
        height:parent.height - imageHead.height
        source: "img/pipe.png"
        fillMode: Image.Tile
   }
    Image{
        id:imageHead
        y: headUp ? 0 : parent.height - height;
        source: headUp ? "img/pipe_up.png" : "img/pipe_down.png"
    }

}
