import QtQuick 2.15

import SneedTest
import SneedContent

FoodSearchForm {
    width: parent.width
    height: parent.height
    clip: true

    signal searchReady(var servings)

    FoodServingModel {
        id: onlineModel
        offlineSearch: false
    }

    FoodServingModel {
        id: offlineModel
        offlineSearch: true
    }

    RecipeListModel {
        id: recipeModel
    }

    online.model: onlineModel
    online.delegate: FoodServingInfoImpl {
        id: delegate
        clip: true

        mouse.onClicked: {
            foodEdit.edit.foodServing = serving

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.onReady.connect(send)
        }

        onReady: (servings) => {
                     search.accept()
                     searchReady(servings)
                 }
    }

    offline.model: offlineModel
    offline.delegate: online.delegate

    recipes.model: recipeModel
    recipes.delegate: RecipeInfoImpl {
        clip: true

        mouse.onClicked: {
            recipeAdd.add.recipe = recipe

            recipeAdd.add.resetNutrients()
            recipeAdd.open()

            recipeAdd.add.onReady.connect(sendServings)
        }

        onReadyServings: (servings) => {
                     search.accept()
                     searchReady(servings)
                 }
    }

    submit.onClicked: swipeView.currentItem.model.search(searchBar.displayText)
}
