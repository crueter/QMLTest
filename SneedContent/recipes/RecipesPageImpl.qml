import QtQuick 2.15

import SneedTest

RecipesPageForm {
    id: impl
    width: parent.width

    add.onClicked: {
        recipeEdit.recipe.recipe = new Recipe()
        recipeEdit.recipe.open()
        recipeEdit.recipe.ready.connect(addRecipe)
    }

    RecipeListModel {
        id: rlm
        meal: mealNumber
    }

    Component.onCompleted: {
        rlm.loadData()
    }

    listView.model: rlm
    listView.delegate: RecipeInfoImpl {
        function editEntry(recipe) {
            model.recipe = recipe

            rlm.saveData()
        }

        mouse.onClicked: {
            recipeEdit.recipe.recipe = model.recipe

            recipeEdit.recipe.loadData()
            recipeEdit.recipe.open()

            recipeEdit.recipe.ready.connect(editEntry)
        }

        onDeleteFood: {
            rlm.removeRow(foodID)
            rlm.saveData(new Date())
        }

        remove.visible: true
    }
    listView.clip: true

    function addRecipe(recipe) {
        search.food.searchReady.disconnect(addRecipe)
        rlm.add(recipe);

        rlm.saveData()
    }
}
