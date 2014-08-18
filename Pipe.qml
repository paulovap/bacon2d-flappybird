import QtQuick 2.0
import Bacon2D 1.0

Entity {
    property int gapY
    property int gapHeight
    y:0
    implicitHeight: parent.height
    implicitWidth: 20
    fixedRotation: true
    bodyType: Entity.Kinematic

    //physics
    fixtures:[
        Box{
            id:top_pipe_body

            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            width: parent.width - 2
            height: gapY - top_pipe_head.height //
            density: 2
            friction: 0
            Rectangle{
                anchors.fill: parent
                color:'green'
            }
        },
        Box{
            anchors.top: top_pipe_body.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            id:top_pipe_head
            height: 5
            width: parent.width
            density: 2
            friction: 0
            Rectangle{
                anchors.fill: parent
                color:'green'
            }
        },

        Box{
            id:bottom_pipe_head

            anchors.bottom: bottom_pipe_body.top
            anchors.horizontalCenter: parent.horizontalCenter

            height: 5
            width: parent.width
            density: 2
            friction: 0
            Rectangle{
                anchors.fill: parent
                color:'green'
            }
        },

        Box{
            id:bottom_pipe_body

            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            width: parent.width - 5
            height: parent.height - top_pipe_head.height - gapY - gapHeight //
            density: 2
            friction: 0
            categories: Box.Category1
            Rectangle{
                anchors.fill: parent
                color:'green'
            }
        }

    ]
}
