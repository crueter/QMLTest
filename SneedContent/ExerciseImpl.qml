import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: impl

    width: parent.width

    property alias ex: ex

    Exercise {
        id: ex
    }

    function addSet(reps: int, weight: int) {
        console.log("adding set")
        impl.setModel.append(
                    {
                        "reps": reps,
                        "weight": weight,
                        "myId": setModel.count
                    })

        ex.addSet(reps, weight)
    }

    function setName(newName: string) {
        name = newName
        ex.name = name
    }

    remove.onClicked: impl.deleteMe(impl.myId)

    add.onClicked: addSet(0, 0)

    listView.delegate: ExerciseSetImpl {
        width: impl.width
        id: set
        onDeleteSet: {
            impl.setModel.remove(myId)
            ex.removeSet(myId)

            for (var i = myId; i < setModel.count; ++i) {
                impl.setModel.get(i).myId -= 1
            }
        }

        onChanged: (reps, weight, id) =>
                   {
                       ex.changeSet(id, reps, weight)
                   }
    }

    exerciseName.onEditingFinished: setName(exerciseName.displayText)
}
