import QtQuick 2.0

Row{
    property int score: 0
    Repeater{
        model:score.toString().length
        Image{
            source: "img/XX_big.png".replace("XX", Number(String(score).charAt(index)))
        }
    }
}

