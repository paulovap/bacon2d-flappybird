import QtQuick 2.3
import Bacon2D 1.0

Scene{
    id:scene
    physics: true
    gravity: Qt.point(0,9.8)
    pixelsPerMeter:18

    function reset(){
        bird.x = 50;
        bird.y = 200;
    }

    /*
      sky blue background
     */
    Rectangle{
        anchors.fill: parent
        color:"#4ec0ca"
    }

    /*
       parallax part of background. Cities and clouds
     */
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

    /*
      player entity
     */
    Birdy{
        id:bird
        x:50; y:200;


    }

    Component{
        id:pipeComponent
        DoublePipe{
            id:dp
            bodyX:scene.width + 10
            onTouched: scene.game.gameState = Bacon2D.Suspended
            //updateInterval: 16
            height: parent.height
            gapY: 100
            gapHeight: 100
        }
    }

    Floor{
        id:floor
        width: parent.width
        height:112
        z:2
        anchors.left: scene.left
        anchors.bottom: scene.bottom
        scene: scene
        onTouchedFloor: game.gameState = Bacon2D.Suspended
    }

    Keys.onUpPressed: {
        //scene.running = true
        bird.jump()
    }

    Timer{
        property var pipes: []
        id:pipeGenerator
        interval:1250
        repeat: true
        running:scene.running
        onTriggered: {
            var pipe = pipeComponent.createObject(scene, {gapY:100})
            pipes.push(pipe)
        }
        onRunningChanged: if(running == false){
                              reset()
                              pipes.forEach(function(pipe) {
                                  pipe.destroy()
                              });
                              pipes = []
                          }
    }
}
