import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: impl

    remove.onClicked: impl.deleteMe(impl.myId)

    add.onClicked:
        sets.append(
            {
                "reps": 0,
                "weight": 0,
                "myId": sets.count
            })

    listView.delegate: ExerciseSetImpl {
        width: impl.width
        onDeleteSet: {
            sets.remove(myId)

            for (var i = myId; i < sets.count; ++i) {
                sets.get(i).myId -= 1
            }
        }
    }

    exerciseName.onEditingFinished: exercise.name = exerciseName.text

    Exercise {
        id: exercise
    }
}
