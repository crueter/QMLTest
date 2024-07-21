import QtQuick 2.15

FoodServingInfoForm {
    width: parent.width

    signal ready(var servings)

    property int meal

    foodName.text: item.name

    brandServing.text: item.brand + ", " + servingSize.unit(units)

    calories.text: item.nutrients.calories * servingSize.multiplier(units) + "kcal"

    function send(servings) {
        foodEdit.edit.onReady.disconnect(send)
        ready(servings)
    }

    remove.onClicked: deleteFood(foodID)
}
