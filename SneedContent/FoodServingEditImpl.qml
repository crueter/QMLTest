import QtQuick 2.15

FoodServingEditForm {
    width: parent.width
    foodName.text: item.name

    brandServing.text: item.brand + ", " + servingSize.unit(units)

    calories.text: item.nutrients.calories * servingSize.multiplier(units) + "kcal"
}
