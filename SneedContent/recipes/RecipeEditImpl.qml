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
    property int mealNumber

    recipeName.text: recipe.name
    servings.value: recipe.servings

    function loadData() {
        fsm.add(recipe.foods)
    }

    calories.text: recipe.nutrients(recipe.servings).calories
    carbs.text: recipe.nutrients(recipe.servings).carbs
    fat.text: recipe.nutrients(recipe.servings).fat
    protein.text: recipe.nutrients(recipe.servings).protein

    listView.model: fsm
    listView.delegate: FoodServingInfoImpl {
        function editEntry(item, serving, units) {
            model.units = units
            model.servingSize = serving

            recipe.foods = fsm.foods

            // fsm.saveData(new Date())
            foodEdit.edit.ready.disconnect(editEntry)
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
}
