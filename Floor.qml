import QtQuick 2.0
import Bacon2D 1.0

Entity{
    id:floor
    property alias fixture: floorFixture
    implicitWidth: scene.width
    implicitHeight: 20
    bodyType: Entity.Static
    fixtures: Box {
        id:floorFixture
        anchors.fill: parent
        friction: 1
        density: 1
        categories: Box.Category2
    }
    anchors{
        left: parent.left
        bottom: parent.bottom
    }
    Rectangle{
        anchors.fill: parent
        color:"green"
    }
}
