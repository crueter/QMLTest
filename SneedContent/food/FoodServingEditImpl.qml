import QtQuick 2.15

import SneedTest

FoodServingEditForm {
    width: parent.width
    height: parent.height

    FoodServingComboBoxModel {
        id: fsm
    }

    property var foodServing

    foodName.text: foodServing.item.name
    servings.realValue: foodServing.units

    unit.model: fsm
    unit.textRole: "name"
    unit.valueRole: "size"
    unit.onActivated: foodServing.size = currentValue
    unit.Component.onCompleted: {
        fsm.add(foodServing.item.servingSizes)
        currentIndex = indexOfValue(foodServing.size)
    }

    calories.text: unit.currentValue.multiplier(servings.realValue) * foodServing.item.nutrients.calories
    // carbs
    // fat
    // protein
}
