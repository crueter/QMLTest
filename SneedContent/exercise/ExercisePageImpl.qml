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
        height: 85 + 60 * listView.count

        onDeleteMe: {
                    exercises.removeRow(exID)
                    ex.remove()
                }
    }

    listView.model: exercises

    add.onClicked: exercises.add("")
}
