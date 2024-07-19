import QtQuick 2.15

FoodServingInfoForm {
    width: parent.width

    signal ready(var serving)

    property int meal

    foodName.text: item.name

    brandServing.text: item.brand + ", " + servingSize.unit(units)

    calories.text: item.nutrients.calories * servingSize.multiplier(units) + "kcal"

    function send(serving) {
        console.log("InfoImpl ready")
        ready(serving)
    }
}
