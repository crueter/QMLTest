import QtQuick 2.15

import SneedTest

FoodSearchForm {
    width: parent.width
    height: parent.height

    signal searchReady(var item, var servingSize, var units)

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

        onReady: (item, servingSize, units) => {
                     console.log("FoodSearch " + units)
                     search.accept()
                     searchReady(item, servingSize, units)
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

        onReady: (item, servingSize, units) => {
                     search.accept()
                     searchReady(item, servingSize, units)
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

        onReady: (item, servingSize, units) => {
                     search.accept()
                     searchReady(item, servingSize, units)
                 }
    }

    submit.onClicked: swipeView.currentItem.model.search(searchBar.displayText)
}
