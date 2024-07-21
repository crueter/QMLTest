import QtQuick 2.15

import SneedTest

RecipeAddForm {
    width: parent.width
    height: parent.height

    signal ready(var servings)

    property var recipe

    recipeName.text: recipe.name
    servings.value: recipe.units

    servings.onValueChanged: resetNutrients()

    calories.text: Math.round(recipe.nutrients(servings.value / recipe.units).calories * 10) / 10.
    carbs.text: Math.round(recipe.nutrients(servings.value / recipe.units).carbs * 10) / 10.
    fat.text: Math.round(recipe.nutrients(servings.value / recipe.units).fat * 10) / 10.
    protein.text: Math.round(recipe.nutrients(servings.value / recipe.units).protein * 10) / 10.

    function resetNutrients() {
        calories.text = Math.round(recipe.nutrients(servings.value / recipe.units).calories * 10) / 10.
        carbs.text = Math.round(recipe.nutrients(servings.value / recipe.units).carbs * 10) / 10.
        fat.text = Math.round(recipe.nutrients(servings.value / recipe.units).fat * 10) / 10.
        protein.text = Math.round(recipe.nutrients(servings.value / recipe.units).protein * 10) / 10.
    }
}
