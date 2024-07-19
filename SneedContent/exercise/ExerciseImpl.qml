import QtQuick 2.15

import SneedTest

ExerciseForm {
    id: exercise

    width: parent.width

    property alias ex: ex

    Exercise {
        id: ex
    }

    ExerciseSetsModel {
        id: esm
    }

    function addSet(reps: int, weight: int) {
        console.log("adding set")
        esm.add(reps, weight)

        ex.addSet(reps, weight)
    }

    function setName(newName: string) {
        name = newName
        exerciseName.text = newName

        ex.name = newName
        console.log("Model " + name + " ------ " + newName)
    }

    remove.onClicked: exercise.deleteMe(exID)

    add.onClicked: addSet(0, 0)

    listView.delegate: ExerciseSetImpl {
        width: exercise.width
        id: set

        onDeleteSet: {
            esm.removeRows(setID, 1)
            ex.removeSet(setID)
        }

        onChanged: (reps, weight, id) =>
                   {
                       ex.changeSet(id, reps, weight)
                   }

        Component.onCompleted: {
            repsEdit.value = reps
            weightEdit.value = weight
        }
    }

    exerciseName.onEditingFinished: setName(exerciseName.displayText)

    Component.onCompleted: {
        setName(exerciseName.displayText)

        ex.sets = sets
        esm.setData(sets)
    }
}
