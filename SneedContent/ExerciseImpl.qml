import QtQuick 2.15

ExerciseForm {
    id: impl

    width: parent.width

    remove.onClicked: impl.deleteMe(impl.myId)

    add.onClicked: {
        setModel.append(
                    {
                        "reps": 0,
                        "weight": 0,
                        "myId": sets.count
                    })

        // setszzazz.push(
        //             {
        //                 "reps": 0,
        //                 "weight": 0,
        //             });

        // console.log("Set : " + setszzazz)
        // console.log("Type: " + typeof setszzazz)

        impl.exerciseChanged()
    }

    listView.delegate: ExerciseSetImpl {
        width: impl.width
        id: set
        onDeleteSet: {
            impl.setModel.remove(myId)
            // sets.pop(myId)

            for (var i = myId; i < setModel.count; ++i) {
                impl.setModel.get(i).myId -= 1
            }

            impl.exerciseChanged()
        }

        onChanged: (reps, weight, id) =>
                   {
                       // sets[id] = {
                       //     "reps": reps,
                       //     "weight": weight
                       // }

                       impl.exerciseChanged()
                   }
    }

    exerciseName.onEditingFinished: {
        name = exerciseName.displayText
        impl.exerciseChanged()
    }
}
