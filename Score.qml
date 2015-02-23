import QtQuick 2.0

Row{
    property int score: 0
    property string digitUrlTemplate:"img/XX_big.png"

    Repeater{
        model:score.toString().length
        Image{
            source: digitUrlTemplate.replace("XX", Number(String(score).charAt(index)))
        }
    }
}

