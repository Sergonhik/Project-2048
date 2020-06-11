import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.1

 GridLayout {
     id:gl
     width: 600
     height: 600
     columns:5
     rows: 5

     columnSpacing: 0
     rowSpacing: 0

     function newGame(){
         var newGameConfigs = helper.newGame()
         for (var i=0; i< newGameConfigs.length; i++){
             bricks.itemAt(i).config = newGameConfigs[i]
             bricks.itemAt(i).smthch()
         }
        toolbar.score = 4;

     }
     function goleft(){
         var brickConfigs = []
         for (var i=0; i< bricks.count; i++)
             brickConfigs.push(bricks.itemAt(i).config)
         var newBrickConfigs = helper.goleft(brickConfigs) //получаем сдвинутые кубики(влево)
         var spnewBrickConfigs = helper.sprnd(newBrickConfigs) //получаем сдвинутые кубики + 2 новых кубика
         if (spnewBrickConfigs[0]===-999){
             loseDialog.visible = true
             return
         }
         for (var i=0; i< spnewBrickConfigs.length; i++){
             bricks.itemAt(i).config = spnewBrickConfigs[i]
             bricks.itemAt(i).smthch()
             if (spnewBrickConfigs[i]===1024){
                 winDialog.visible = true
                 return
             }
         }
         toolbar.score += 4;
     }
     function goright(){
         var brickConfigs = []
         for (var i=0; i< bricks.count; i++)
             brickConfigs.push(bricks.itemAt(i).config)
         var newBrickConfigs = helper.goright(brickConfigs)
         var spnewBrickConfigs = helper.sprnd(newBrickConfigs)
         if (spnewBrickConfigs[0]===-999){
             loseDialog.visible = true
             return
         }
         for (var i=0; i< spnewBrickConfigs.length; i++){
             bricks.itemAt(i).config = spnewBrickConfigs[i]
             bricks.itemAt(i).smthch()
             if (spnewBrickConfigs[i]===1024){
                 winDialog.visible = true
                 return
             }
         }
         toolbar.score += 4;
     }
     function gotop(){
         var brickConfigs = []
         for (var i=0; i< bricks.count; i++)
             brickConfigs.push(bricks.itemAt(i).config)
         var newBrickConfigs = helper.gotop(brickConfigs)
         var spnewBrickConfigs = helper.sprnd(newBrickConfigs)
         if (spnewBrickConfigs[0]===-999){
             loseDialog.visible = true
             return
         }
         for (var i=0; i< spnewBrickConfigs.length; i++){
             bricks.itemAt(i).config = spnewBrickConfigs[i]
             bricks.itemAt(i).smthch()
             if (spnewBrickConfigs[i]===1024){
                 winDialog.visible = true
                 return
             }
         }
         toolbar.score += 4;
     }
     function gobottom(){
         var brickConfigs = []
         for (var i=0; i< bricks.count; i++)
             brickConfigs.push(bricks.itemAt(i).config)
         var newBrickConfigs = helper.gobottom(brickConfigs)
         var spnewBrickConfigs = helper.sprnd(newBrickConfigs)
         if (spnewBrickConfigs[0]===-999){
             loseDialog.visible = true
             return
         }
         for (var i=0; i< spnewBrickConfigs.length; i++){
             bricks.itemAt(i).config = spnewBrickConfigs[i]
             bricks.itemAt(i).smthch()
             if (spnewBrickConfigs[i]===1024){
                 winDialog.visible = true
                 return
             }
         }
         toolbar.score += 4;
     }

     MessageDialog {
         visible: false
         id: loseDialog
         title: "Поражение"
         text: "Поле перезаполнено. Вы проиграли."
         onAccepted: {
             loseDialog.visible = false
             newGame()
         }
     }

     MessageDialog {
         visible: false
         id: winDialog
         title: "Победа"
         text: "Поздравляем! Вы набрали 1024 очка в одном блоке и выиграли!"
         onAccepted: {
             winDialog.visible = false
             newGame()
         }
     }
     Repeater{
         id: bricks
         model: 25
         Brick {
         }
     }

     Component.onCompleted: {
         newGame()
     }

     MessageDialog {
         visible: true
         id: helloDialog
         title: "Добро пожаловать!"
         text: "Добро пожаловать в игру 2048. Для победы нужно набрать 1024 очка в одном кубике. Когда кубики с одинаковыми значениями соединяются, из двух таких кубиков образуется новый кубик с суммой этих значений. Поражение засчитывается тогда, когда на поле не остается места для генерации двух новых кубиков(каждое перемещение кубиков вызывает два дополнительных кубика со значением 2). Для перемещения кубиков используйте клавиши со стрелочками(влево, вправо, вверх, вниз соответственно)."
         onAccepted: {
             helloDialog.visible = false
         }
     }
}
