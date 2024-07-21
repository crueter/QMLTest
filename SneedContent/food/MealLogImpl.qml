import QtQuick 2.15
import QtQuick.Controls

import SneedTest

MealLogForm {
    id: impl
    width: parent.width
    // height: Layout.height
    // clip: true

    add.onClicked: {
        search.food.opening()
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
        function editEntry(servings) {
            foodEdit.edit.ready.disconnect(editEntry)

            let food = servings[0]
            model.serving = food
            model.servingSize = food.size

            fsm.saveData(new Date())
        }

        mouse.onClicked: {
            foodEdit.edit.foodServing = serving

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

    function addFood(servings) {
        search.food.searchReady.disconnect(addFood)

        fsm.add(servings);
        fsm.cache(servings)

        fsm.saveData(new Date())
    }
}
