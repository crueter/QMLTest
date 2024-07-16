import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: impl

    remove.onClicked: impl.deleteMe(impl.myId)

    add.onClicked: {
        sets.append(
            {
                "reps": 0,
                "weight": 0,
                "myId": sets.count
            })
        console.log("ok")
    }

    listView.delegate: ExerciseSetImpl {
        width: impl.width
        onDeleteSet: {
            sets.remove(myId)

            for (var i = myId; i < sets.count; ++i) {
                sets.get(i).myId -= 1
            }

            impl.exerciseChanged()
        }

        onChanged: {
            let sets = []

            for (let i = 0; i < sets.count; ++i) {
                set = sets.get(i).set
                sets.push(set)
            }

            exercise.sets = sets

            impl.exerciseChanged()
        }
    }

    exerciseName.onEditingFinished: {
        exercise.name = exerciseName.text
        impl.exerciseChanged()
    }

    Exercise {
        id: exercise
    }
}
