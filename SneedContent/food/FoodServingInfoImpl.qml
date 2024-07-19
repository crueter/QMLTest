import QtQuick 2.15

FoodServingInfoForm {
    width: parent.width
    foodName.text: item.name

    brandServing.text: item.brand + ", " + servingSize.unit(units)

    calories.text: item.nutrients.calories * servingSize.multiplier(units) + "kcal"

    mouse.onClicked: {
        foodEdit.edit.foodServing = serving
        console.log(item.name)
        foodEdit.open()
    }
}
