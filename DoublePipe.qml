import QtQuick 2.0
import Bacon2D 1.0

Entity{
    id:root

    property real bodyX;
    property int gapY
    property int gapHeight

    signal touched(var other)
    width:pipeUp.width
    Pipe{
        id:pipeUp
        headUp: false
        x:bodyX
        height: gapY
        onTouched: root.touched(other)
    }
    Pipe{
        x:bodyX; y: gapY + gapHeight
        height: parent.height -gapY -gapHeight
        headUp: true
        onTouched: root.touched(other)
    }

    behavior: ScriptBehavior{
        script: {
            root.bodyX-= 1.5
        }
    }
}

