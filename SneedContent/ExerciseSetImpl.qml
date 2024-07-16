import QtQuick 2.15

import SneedTest

ExerciseSetForm {
    id: exerciseSetImpl

    // property alias set: set

    remove.onClicked: exerciseSetImpl.deleteSet(myId)

    // ExerciseSet {
    //     id: set
    // }

    repsEdit.onValueChanged: {
                                 reps = repsEdit.value
                                 // set.reps = reps
                                 exerciseSetImpl.changed()
                             }

    weightEdit.onValueChanged: {
                                   weight = weightEdit.value
                                   // set.weight = weight
                                   exerciseSetImpl.changed()
                               }
}
