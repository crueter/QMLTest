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
        onDeleteMe: {
            exercises.remove(myId)

            for (var i = myId; i < exercises.count; ++i) {
                exercises.get(i).myId -= 1
            }

            saveData();
        }

        onExerciseChanged: saveData()
    }

    add.onClicked: exercises.append({"name": "", "myId": exercises.count})

    function saveData() {
        let ex = []

        for (let i = 0; i < exercises.count; ++i) {
            ex.push(exercises.get(i))
            console.log(exercises.get(i).name)
        }

        data.saveExercises(ex, new Date())
        // console.log(ex)
    }
}
