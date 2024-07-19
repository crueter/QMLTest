import QtQuick 2.15
import QtQuick.Controls

MealLogForm {
    width: parent.width

    add.onClicked: {
        search.food.mealNumber = mealNumber
        search.open()
    }
}
