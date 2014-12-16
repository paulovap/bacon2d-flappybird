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
    property bool headUp: true
    clip:true
    width: imageHead.width

    fixedRotation: true

    //physics
    fixtures:[
        Box{
            id:boxPipeHead
            x:0; width: 50;height: 5
            y: headUp? 0 : parent.height - 5
            density: 2
            friction: 0
        },

        Box{
            id:boxPipeBody
            density: 2
            friction: 0
            categories: Box.Category1
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
        x:0; y: headUp ? 0 : parent.height - height;
        source: headUp ? "img/pipe_up.png" : "img/pipe_down.png"
    }

}
