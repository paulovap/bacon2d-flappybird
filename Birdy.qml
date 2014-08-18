import QtQuick 2.0
import Bacon2D 1.0

Entity{
    id:piggy
    property bool jumping: false
    property Box ground

    implicitWidth:20;
    implicitHeight:20;

    signal hit

    states: [
        State {
            name: "jumping"
            PropertyChanges {
                target: piggy
                jumping:true

            }
        }
    ]

    //physics
    fixedRotation: true
    bodyType: Entity.Dynamic
    fixtures:[
        Box {
            id:body
            anchors.fill: parent
            density: 2
            friction: 0

            onBeginContact: {
                if(other === ground)
                    piggy.state = ""
                else
                    hit(other)

            }
        }
    ]

    //Drawing
    Rectangle{ anchors.fill:parent; color:"red"}

    //Actions
    function jump(){
//        if(state === "jumping")
//            return;
        state = "jumping"
        piggy.applyForce(Qt.point(0,-400),
                        getWorldCenter());
    }
}
