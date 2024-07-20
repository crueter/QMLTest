import QtQuick 2.15

FoodPageForm {
    id: impl
    mealLog1.mealName.text: settings.meal1Name
    mealLog2.mealName.text: settings.meal2Name
    mealLog3.mealName.text: settings.meal3Name
    mealLog4.mealName.text: settings.meal4Name
    mealLog5.mealName.text: settings.meal5Name

    mealLog1.mealNumber: 1
    mealLog2.mealNumber: 2
    mealLog3.mealNumber: 3
    mealLog4.mealNumber: 4
    mealLog5.mealNumber: 5
}
