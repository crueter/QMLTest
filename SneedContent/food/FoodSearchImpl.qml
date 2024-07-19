import QtQuick 2.15

import SneedTest

FoodSearchForm {
    width: parent.width
    height: parent.height

    signal searchReady(var serving)

    property int mealNumber

    FoodServingModel {
        id: onlineModel
        meal: mealNumber
    }

    FoodServingModel {
        id: offlineModel
        meal: mealNumber
    }

    FoodServingModel {
        id: recipeModel
        meal: mealNumber
    }

    online.model: onlineModel
    online.delegate: FoodServingInfoImpl {
        mouse.onClicked: {
            foodEdit.edit.foodServing = serving
            foodEdit.edit.mealNumber = mealNumber

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.onReady.connect(send)
        }

        onReady: (serving) => {
                     console.log("Lets Go")
                     search.accept()
                     searchReady(serving)
                 }
    }

    offline.model: offlineModel
    offline.delegate: FoodServingInfoImpl {
        mouse.onClicked: {
            foodEdit.edit.foodServing = serving
            foodEdit.edit.mealNumber = mealNumber

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.onReady.connect(send)
        }

        onReady: (serving) => {
                     search.accept()
                     searchReady(serving)
                 }
    }

    recipes.model: recipeModel
    recipes.delegate: FoodServingInfoImpl {
        mouse.onClicked: {
            foodEdit.edit.foodServing = serving
            foodEdit.edit.mealNumber = mealNumber

            foodEdit.edit.loadData()
            foodEdit.open()

            foodEdit.edit.onReady.connect(send)
        }

        onReady: (serving) => {
                     search.accept()
                     searchReady(serving)
                 }
    }

    submit.onClicked: swipeView.currentItem.model.search(searchBar.displayText)
}
