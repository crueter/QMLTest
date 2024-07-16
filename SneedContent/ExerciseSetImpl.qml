import QtQuick 2.15
import QtQuick.Controls 2.15

ExerciseSetForm {
    id: exerciseSetImpl

    remove.onClicked: exerciseSetImpl.deleteSet(myId)

    repsEdit.onValueChanged: {
        reps = value
    }

    weightEdit.onValueChanged: {
        weight = value
    }
}
