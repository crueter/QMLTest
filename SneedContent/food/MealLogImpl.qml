import QtQuick 2.15
import QtQuick.Controls

import SneedTest

MealLogForm {
    width: parent.width
    height: 500

    add.onClicked: {
        search.food.mealNumber = mealNumber
        search.open()
        search.food.searchReady.connect(addFood)
    }

    FoodServingModel {
        id: fsm
    }

    listView.model: fsm
    listView.delegate: FoodServingInfoImpl {
        mouse.onClicked: {
            foodEdit.edit.foodServing = serving
            foodEdit.edit.mealNumber = mealNumber

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.onReady.connect(send)
        }}

    function addFood(serving) {
        console.log("Adding Food!!! " + serving.units)
        fsm.add(serving);
        console.log(fsm)
    }
}
