import QtQuick 2.15
import QtQuick.Controls

import SneedTest

MealLogForm {
    id: impl
    width: parent.width
    // height: Layout.height
    // clip: true

    add.onClicked: {
        search.food.mealNumber = mealNumber
        search.open()
        search.food.searchReady.connect(addFood)
    }

    FoodServingModel {
        id: fsm
        meal: mealNumber
    }

    Component.onCompleted: {
        fsm.loadData(new Date())
    }

    listView.model: fsm
    listView.delegate: FoodServingInfoImpl {
        function editEntry(item, serving, units) {
            model.units = units
            model.servingSize = serving

            fsm.saveData(new Date())
        }

        mouse.onClicked: {
            foodEdit.edit.foodServing = serving
            foodEdit.edit.mealNumber = mealNumber

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.ready.connect(editEntry)
        }

        onDeleteFood: {
            fsm.removeRow(foodID)
            fsm.saveData(new Date())
        }

        remove.visible: true
    }
    listView.clip: true

    function addFood(item, servingSize, units) {
        search.food.searchReady.disconnect(addFood)
        fsm.add(item, servingSize, units);
        fsm.cache(item)
        fsm.saveData(new Date())

    }
}
