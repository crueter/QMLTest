import QtQuick 2.15

import SneedTest

ExerciseSetForm {
    id: exerciseSetImpl

    remove.onClicked: exerciseSetImpl.deleteSet(myId)

    repsEdit.onValueChanged: {
        reps = value
        set.reps = value
        exerciseSetImpl.changed()
    }

    weightEdit.onValueChanged: {
        weight = value
        set.weight = value
        exerciseSetImpl.changed()
    }

    ExerciseSet {
        id: set
    }
}
