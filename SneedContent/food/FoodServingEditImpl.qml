import QtQuick 2.15
import QtQuick.Controls 2.15

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
    servings.dValue: foodServing.units

    unit.model: fsm
    unit.textRole: "name"
    unit.valueRole: "size"

    unit.onCurrentIndexChanged: {
        foodServing.size = unit.valueAt(unit.currentIndex)
    }

    servings.onDValueChanged: foodServing.units = servings.dValue

    function loadData() {
        fsm.clear()
        fsm.add(foodServing.item.servingSizes)
        servings.dValue = foodServing.units
        unit.currentIndex = unit.indexOfValue(foodServing.size)
    }

    calories.text: Math.round(unit.currentValue.multiplier(servings.dValue) * foodServing.item.nutrients.calories * 10.) / 10.
    carbs.text: Math.round(unit.currentValue.multiplier(servings.dValue) * foodServing.item.nutrients.carbs * 10.) / 10.
    fat.text: Math.round(unit.currentValue.multiplier(servings.dValue) * foodServing.item.nutrients.fat * 10.) / 10.
    protein.text: Math.round(unit.currentValue.multiplier(servings.dValue) * foodServing.item.nutrients.protein * 10.) / 10.
}
