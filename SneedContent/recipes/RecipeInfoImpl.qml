import QtQuick 2.15

RecipeInfoForm {
    width: parent.width

    signal ready(var recipe)

    property int meal

    recipeName.text: name

    servingSize.text: servings + " servings"

    calories.text: recipe.nutrients(servings) + "kcal"

    function send(recipe) {
        foodEdit.edit.onReady.disconnect(send)
        ready(recipe)
    }

    remove.onClicked: deleteRecipe(recipeID)
}
