import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: impl

    width: parent.width

    remove.onClicked: impl.deleteMe(impl.myId)

    Exercise {
        id: exercise
    }

    add.onClicked: {
        sets.append(
                    {
                        "reps": 0,
                        "weight": 0,
                        "myId": sets.count
                    })
        impl.exerciseChanged()
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
            let setList = []

            for (let i = 0; i < sets.count; ++i) {
                let set = sets.get(i)
                console.log(set.myId)
                // console.log(set.reps)
                setList.push(
                            {
                                "reps": set.reps,
                                "weight": set.weight
                            })
            }

            exercise.sets = setList

            impl.exerciseChanged()
        }
    }

    exerciseName.onEditingFinished: {
        exercise.name = exerciseName.displayText
        name = exercise.name

        console.log(exercise.name)
        impl.exerciseChanged()
    }
}
