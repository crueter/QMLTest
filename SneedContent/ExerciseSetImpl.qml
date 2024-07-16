import QtQuick 2.15

ExerciseSetForm {
    id: exerciseSetImpl

    remove.onClicked: exerciseSetImpl.deleteSet(myId)

    repsEdit.onValueChanged: {
        reps = repsEdit.value
        console.log(reps)
        exerciseSetImpl.changed(reps, weight, myId)
    }

    weightEdit.onValueChanged: {
        weight = weightEdit.value
        console.log(weight);
        exerciseSetImpl.changed(reps, weight, myId)
    }
}
