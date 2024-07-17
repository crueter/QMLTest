import QtQuick 2.15
import QtQuick.Controls 2.15

import SneedTest

ExercisePageForm {
    id: exercisePageImpl

    function addExercise(exercise) {
        exercises.append({"name": exercise.name, "myId": exercises.count})
    }

    function addSet(idx: int, reps: int, weight: int) {
        listView.itemAtIndex(idx).addSet(reps, weight)
    }

    listView.delegate: ExerciseImpl {
        id: exercise

        onDeleteMe: {
            exercises.remove(myId)
            exercise.remove()

            for (var i = myId; i < exercises.count; ++i) {
                exercises.get(i).myId -= 1
            }
        }
    }

    add.onClicked: exercises.append({"name": "", "myId": exercises.count})

    roundButton.onClicked: {
        listView.itemAtIndex(0).addSet(0, 1)
        listView.itemAtIndex(0).setName(exercises.get(0).name);
    }
}
