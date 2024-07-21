import QtQuick 2.15

RecipeInfoForm {
    width: parent.width

    signal ready(var recipe)
    signal readyServings(var servings)

    property int meal

    recipeName.text: recipe.name

    servingSize.text: servings + " servings"

    calories.text: Math.round(recipe.nutrients().calories * 10.) / 10.0 + "kcal"

    function send(recipe) {
        recipeDialog.recipeEdit.onReady.disconnect(send)
        ready(recipe)
    }

    function sendServings(servings) {
        recipeAdd.add.onReady.disconnect(sendServings)
        readyServings(servings)
    }

    remove.onClicked: deleteRecipe(recipeID)
}
