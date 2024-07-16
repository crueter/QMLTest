import QtQuick 2.15
import QtQuick.Controls 2.15

import SneedTest

ExercisePageForm {
    id: exercisePageImpl

    DataManager {
        id: data
    }

    listView.delegate: ExerciseImpl {
        // width: listView.width
        id: exercise

        onDeleteMe: {
            exercises.remove(myId)

            for (var i = myId; i < exercises.count; ++i) {
                exercises.get(i).myId -= 1
                console.log("id " + exercises.get(i).myId)
            }

            saveData();
        }

        onExerciseChanged: saveData()
    }

    add.onClicked: exercises.append({"sets": [], "name": "", "myId": exercises.count})

    function saveData() {
        let exList = []

        for (let i = 0; i < exercises.count; ++i) {
            let ex = exercises.get(i)
            let obj = {
                "name": ex.name,
                "sets": []
            }

            for (var key in ex) {
                console.log("Key " + key)
            }

            console.log(ex.sets)

            for (let j = 0; j < ex.sets.count; ++i) {
                let set = ex.sets[i]
                obj["sets"].push({
                                     "reps": set.reps,
                                     "weight": set.weight
                                 })
            }

            exList.push(ex)
        }

        data.saveExercises(exList, new Date())
        // console.log(ex)
    }
}
