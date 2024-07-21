import QtQuick 2.15

import SneedTest

FoodServingEditForm {
    width: parent.width
    height: parent.height

    FoodServingComboBoxModel {
        id: fsm
    }

    signal ready(var servings)

    property var foodServing

    foodName.text: foodServing.item.name
    servings.value: foodServing.units

    unit.model: fsm
    unit.textRole: "name"
    unit.valueRole: "size"

    unit.onCurrentIndexChanged: foodServing.serving = unit.currentValue
    servings.onValueChanged: foodServing.units = servings.value

    function loadData() {
        fsm.add(foodServing.item.servingSizes)
        unit.currentIndex = unit.indexOfValue(foodServing.size)
    }

    calories.text: unit.currentValue.multiplier(servings.value) * foodServing.item.nutrients.calories
    carbs.text: unit.currentValue.multiplier(servings.value) * foodServing.item.nutrients.carbs
    fat.text: unit.currentValue.multiplier(servings.value) * foodServing.item.nutrients.fat
    protein.text: unit.currentValue.multiplier(servings.value) * foodServing.item.nutrients.protein
}
