import QtQuick 2.15

ExerciseSetForm {
    id: exerciseSetImpl

    remove.onClicked: exerciseSetImpl.deleteSet(setID)

    repsEdit.onValueChanged: {
        reps = repsEdit.value

        exerciseSetImpl.changed(repsEdit.value, weightEdit.value, setID)
    }

    weightEdit.onValueChanged: {
        weight = weightEdit.value

        exerciseSetImpl.changed(repsEdit.value, weightEdit.value, setID)
    }
}
