import QtQuick 2.0

Rectangle {
    width: 116; height: 116
    radius: 20
    id: cbr

    property int config: 0

    border.width:3
    border.color: "#B9AEA0"
    function smthch(){
        upcol()
        if (config>0)
            num.text = config
        else
            num.text = ""
    }
    function upcol(){
        color: {
            if (config===0)
                color = "#CCC1B2"
            if (config===2)
                color = "#F0E4DA"
            if (config===4)
                color = "#EAE1C6"
            if (config===8)
                color = "#F1B17B"
            if (config===16)
                color = "#EC8D54"
            if (config===32)
                color = "#F57C63"
            if (config===64)
                color = "#F55E3A"
            if (config===128)
                color = "#EDCE74"
            if (config===256)
                color = "#F1D04C"
            if (config===512)
                color = "#F1CF6A"
            if (config===1024)
                color = "#EEC342"
            if (config===2048)
                color = "#EDC032"
        }
    }
    Text {
        id: num
        text: (config>0) ? config : ""
        font.family: "Impact"
        font.pointSize: 24
        color: "white"
        anchors.centerIn: parent
    }
}
