import QtQuick 2.15
import QtQuick.Controls 2.15

import SneedTest

ExercisePageForm {
    id: exercisePageImpl

    // property list<var>
    // DataManager {
    //     id: data
    // }

    listView.delegate: ExerciseImpl {
        // width: listView.width
        id: exercise

        onDeleteMe: {
            exercises.remove(myId)

            for (var i = myId; i < exercises.count; ++i) {
                exercises.get(i).myId -= 1
                console.log("id " + exercises.get(i).myId)
            }
        }
    }

    add.onClicked: exercises.append({"name": "", "myId": exercises.count})

    function saveData() {
        let exList = []

        // console.log("Exerc " + exercises.count)

        for (let i = 0; i < exercises.count; ++i) {
            let ex = exercises.get(i)
            // console.log(ex["ex"])
            console.log(ex.ex.sets)
            let obj = {
                "name": ex.name,
                "sets": []
            }

            // for (var key in ex) {
            //     console.log("key " + key + " is a(n) " + typeof ex[key])
            // }

            // // console.log("Count " + ex.sets.setProperty(0, "name", "sneed"))
            // console.log("Count " + typeof ex.sets)

            // for (let j = 0; j < ex.sets.count; ++j) {
            //     // console.log(ex.sets.count)
            //     // console.log(j)
            //     // console.log(ex.sets[j])
            //     let set = ex.sets[j]
            //     console.log("Ok" + set.reps)
            //     obj["sets"].push({
            //                          "reps": set.reps,
            //                          "weight": set.weight
            //                      })
            //     console.log("Okay " + obj["sets"][j].reps)
            // }

            exList.push(obj)
            // console.log(ex.sets)
        }

        // data.saveExercises(exList, new Date())
        // console.log(ex)
    }
}
