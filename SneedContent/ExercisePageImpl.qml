import QtQuick 2.15
import QtQuick.Controls 2.15

import SneedTest

ExercisePageForm {
    id: exercisePageImpl

    property alias exercises: exercises

    ExerciseListModel {
        id: exercises
    }

    listView.delegate: ExerciseImpl {
        id: exercise
    }

    add.onClicked: exercises.add("")
}
