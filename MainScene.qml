import QtQuick 2.3
import Bacon2D 1.0

Scene{
    id:scene

    property var pipes: []

    state: "newgame"
    states:[
        State{
            name:"newgame"
            StateChangeScript{ script:reset() }
        },
        State{
            name:"endgame"
        }
    ]

    physics: true
    gravity: Qt.point(0,9.8)
    pixelsPerMeter:18

    Keys.onUpPressed: bird.jump()

    function reset(){
        bird.x = 50;
        bird.y = 200;
        game.gameState = Bacon2D.Running

        pipes.forEach(function(pipe){ pipe.destroy() });
        pipes = []
        scoreItem.score = 0
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

    Score{
        id:scoreItem
        anchors{
            horizontalCenter: parent.horizontalCenter;
            top:parent.top; topMargin: 20
        }
        score: 0
        z:10
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
            property bool passed: false
            bodyX:scene.width + 10
            onTouched: scene.game.gameState = Bacon2D.Suspended
            height: parent.height
            gapY: 100
            gapHeight: 100

            onBodyXChanged: {
                if(bodyX  < bird.x && !passed){
                    scoreItem.score++
                    passed = true
                }
            }
        }
    }

    Floor{
        id:floor

        anchors.left: scene.left
        anchors.bottom: scene.bottom

        width: parent.width; height:112
        scene: scene
        z:2

        onTouchedFloor: game.gameState = Bacon2D.Suspended
    }

    Timer{

        id:pipeGenerator
        interval:2500; repeat: true
        running:scene.running

        onTriggered: {
            var pipe = pipeComponent.createObject(scene, {gapY:60 + Math.floor(Math.random()*10)*0.1*80})
            pipes.push(pipe)
        }
    }

    MultiPointTouchArea{
        anchors.fill: parent
        maximumTouchPoints: 1
        mouseEnabled: true
        onPressed: if(scene.running) bird.jump(); else reset();
    }
}
