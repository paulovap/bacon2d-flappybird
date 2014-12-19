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
    id:floor

    property Scene scene

    signal touchedFloor(var other)

    visible:true

    BoxBody{
        id:body
        target: floor
        world: scene.world
        bodyType: Body.Static
        width:floor.width; height:floor.height
        density:1
        friction: 1
        sensor:false
        onBeginContact: touchedFloor(other)
    }

    InfiniteScrollItem{
        id:scrollItem
        Image{
            width: floor.width; height: floor.height
            source: "img/land.png"
            fillMode: Image.Tile
        }
    }
    Timer{
        running:scene.running
        interval: 16
        repeat: true
        onTriggered: scrollItem.offsetX +=0.3
    }
}
