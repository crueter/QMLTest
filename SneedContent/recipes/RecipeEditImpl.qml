import QtQuick 2.15

import SneedTest
import SneedContent

RecipeEditForm {
    width: parent.width
    height: parent.height

    FoodServingModel {
        id: fsm
    }

    signal ready(var recipe)

    property var recipe

    recipeName.text: recipe.name
    servings.dValue: recipe.servings

    function loadData() {
        fsm.clear()
        fsm.add(recipe.foods)
    }

    add.onClicked: {
        search.open()
        search.food.searchReady.connect(addFood)
    }

    calories.text: Math.round(recipe.nutrients().calories * 10) / 10.
    carbs.text: Math.round(recipe.nutrients().carbs * 10) / 10.
    fat.text: Math.round(recipe.nutrients().fat * 10) / 10.
    protein.text: Math.round(recipe.nutrients().protein * 10) / 10.

    listView.model: fsm
    listView.delegate: FoodServingInfoImpl {
        function editEntry(item, serving, units) {
            model.units = units
            model.servingSize = serving

            recipe.foods = fsm.foods

            resetNutrients()

            foodEdit.edit.ready.disconnect(editEntry)
        }

        mouse.onClicked: {
            foodEdit.edit.foodServing = serving

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.ready.connect(editEntry)
        }

        onDeleteFood: {
            fsm.removeRow(foodID)

            recipe.foods = fsm.foods
            resetNutrients()
        }

        remove.visible: true
    }

    function resetNutrients() {
        calories.text =  Math.round(recipe.nutrients().calories * 10) / 10.
        carbs.text = Math.round(recipe.nutrients().carbs * 10) / 10.
        fat.text = Math.round(recipe.nutrients().fat * 10) / 10.
        protein.text = Math.round(recipe.nutrients().protein * 10) / 10.
    }

    function addFood(item, serving, units) {
        search.food.searchReady.disconnect(addFood)
        fsm.add(item, serving, units);
        fsm.cache(item)

        recipe.foods = fsm.foods
        resetNutrients()
    }
}
