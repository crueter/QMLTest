import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: impl

    width: parent.width

    property alias ex: ex

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
        }

        onChanged: (reps, weight, id) =>
                   {
                       ex.changeSet(id, reps, weight)
                   }
    }

    exerciseName.onEditingFinished: {
        name = exerciseName.displayText
        ex.name = name
    }
}
