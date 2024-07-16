import QtQuick 2.15

ExerciseForm {
    id: impl

    width: parent.width

    property list<var> sets

    remove.onClicked: impl.deleteMe(impl.myId)

    add.onClicked: {
        setsModel.append(
                    {
                        "reps": 0,
                        "weight": 0,
                        "myId": setsModel.count
                    })

        impl.sets.push(
                    {
                        "reps": 0,
                        "weight": 0,
                    })

        impl.exerciseChanged()
    }

    listView.delegate: ExerciseSetImpl {
        width: impl.width
        id: set
        onDeleteSet: {
            impl.setsModel.remove(myId)

            for (var i = myId; i < setsModel.count; ++i) {
                impl.setsModel.get(i).myId -= 1
            }

            impl.exerciseChanged()
        }

        onChanged:
                   {
                       impl.exerciseChanged()
                   }
    }

    exerciseName.onEditingFinished: {
        name = exerciseName.displayText
        impl.exerciseChanged()
    }
}
