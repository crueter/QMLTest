import QtQuick 2.15

ExerciseSetForm {
    id: exerciseSetImpl

    remove.onClicked: exerciseSetImpl.deleteSet(myId)

    repsEdit.onValueChanged: {
        reps = repsEdit.value

        exerciseSetImpl.changed(reps, weight, myId)
    }

    weightEdit.onValueChanged: {
        weight = weightEdit.value

        exerciseSetImpl.changed(reps, weight, myId)
    }
}
