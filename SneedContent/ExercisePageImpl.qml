import QtQuick 2.15
import QtQuick.Controls 2.15

ExercisePageForm {
    id: exercisePageImpl

    add.onClicked: exercises.append({"name": "", "myId": exercises.count})

    listView.delegate: ExerciseImpl {
        width: root.width
        onDeleteMe: {
            exercises.remove(myId)

            for (var i = myId; i < exercises.count; ++i) {
                exercises.get(i).myId -= 1
            }
        }
    }
}
