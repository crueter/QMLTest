import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: impl

    width: parent.width

    Exercise {
        id: ex
    }

    remove.onClicked: impl.deleteMe(impl.myId)

    add.onClicked: {
        impl.setModel.append(
                    {
                        "reps": 0,
                        "weight": 0,
                        "myId": setModel.count
                    })

        ex.addSet()
    }

    listView.delegate: ExerciseSetImpl {
        width: impl.width
        id: set
        onDeleteSet: {
            impl.setModel.remove(myId)
            ex.removeSet(myId)

            for (var i = myId; i < setModel.count; ++i) {
                impl.setModel.get(i).myId -= 1
            }

            dataManager.saveExercise(ex, new Date())
        }

        onChanged: (reps, weight, id) =>
                   {
                       ex.changeSet(id, reps, weight)

                       // ex.sets[id] = {
                       //     "reps": reps,
                       //     "weight": weight
                       // }
                       for (var set in ex.sets) {
                           for (var key in set) {
                               console.log("Set " + set + " Key " + key);
                           }
                       }

                       dataManager.saveExercise(ex, new Date())
                   }
    }

    exerciseName.onEditingFinished: {
        name = exerciseName.displayText
        ex.name = name
    }
}
