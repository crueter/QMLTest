import QtQuick 2.15

import SneedTest

FoodSearchForm {
    width: parent.width
    height: parent.height

    property int mealNumber

    FoodServingModel {
        id: onlineModel
    }

    FoodServingModel {
        id: offlineModel
    }

    FoodServingModel {
        id: recipeModel
    }

    online.model: onlineModel
    online.delegate: FoodServingEditImpl {}

    offline.model: offlineModel
    offline.delegate: FoodServingEditImpl {}

    recipes.model: recipeModel
    recipes.delegate: FoodServingEditImpl {}

    submit.onClicked: swipeView.currentItem.model.search(search.displayText)
}
