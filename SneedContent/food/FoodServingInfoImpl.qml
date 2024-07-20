import QtQuick 2.15

FoodServingInfoForm {
    width: parent.width

    signal ready(var item, var servingSize, var units)

    property int meal

    foodName.text: item.name

    brandServing.text: item.brand + ", " + servingSize.unit(units)

    calories.text: item.nutrients.calories * servingSize.multiplier(units) + "kcal"

    function send(item, servingSize, units) {
        foodEdit.edit.onReady.disconnect(send)
        ready(item, servingSize, units)
    }

    remove.onClicked: deleteFood(foodID)
}
