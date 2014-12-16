/* Floor.qml
 *
 * Copyright (C) 2014 Paulo Pinheiro
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 */

import QtQuick 2.3
import Bacon2D 1.0

Item{
    id:iai
    property alias scene: layer1.scene
    property alias world: body.world
    signal touchedFloor(var other)
    visible:true
    transformOrigin: Item.TopLeft

    BoxBody{
        id:body
        target: iai
        bodyType: Body.Static
        width:iai.width; height:iai.height
        density:1
        friction: 1
        sensor:false
        onBeginContact: touchedFloor(other)
    }

    ImageLayer{
        id: layer1
        source: "img/land.png"
        width:iai.width; height:iai.height
        behavior: ScrollBehavior {
            horizontalStep: -2
        }
    }
}
