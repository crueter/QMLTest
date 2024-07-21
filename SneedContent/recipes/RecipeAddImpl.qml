import QtQuick 2.15

import SneedTest

RecipeAddForm {
    width: parent.width
    height: parent.height

    signal ready(var servings)

    property var recipe

    recipeName.text: recipe.name
    servings.dValue: recipe.servings

    servings.onDValueChanged: resetNutrients()

    calories.text: Math.round(recipe.nutrients().calories * 10 * (servings.dValue / recipe.servings)) / 10.
    carbs.text: Math.round(recipe.nutrients().carbs * 10 * (servings.dValue / recipe.servings)) / 10.
    fat.text: Math.round(recipe.nutrients().fat * 10 * (servings.dValue / recipe.servings)) / 10.
    protein.text: Math.round(recipe.nutrients().protein * 10 * (servings.dValue / recipe.servings)) / 10.

    function resetNutrients() {
        console.log(recipe.servings)
        calories.text = Math.round(recipe.nutrients().calories * 10 * (servings.dValue / recipe.servings)) / 10.
        carbs.text = Math.round(recipe.nutrients().carbs * 10 * (servings.dValue / recipe.servings)) / 10.
        fat.text = Math.round(recipe.nutrients().fat * 10 * (servings.dValue / recipe.servings)) / 10.
        protein.text = Math.round(recipe.nutrients().protein * 10 * (servings.dValue / recipe.servings)) / 10.
    }
}
