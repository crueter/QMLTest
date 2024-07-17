import QtQuick 2.15
import QtQuick.Controls 2.15

import SneedTest

ExercisePageForm {
    id: exercisePageImpl

    function addExercise(exercise) {
        for (var key in exercise) {
            console.log(key)
        }
        console.log(exercise.ex.name)

        exercises.append({"name": exercise.name, "myId": exercises.count})
        // exercises.get(exercises.count - 1)
        // exercises.append()
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
}
