#include "items/Exercise.h"
#include "data/DataManager.h"

Exercise::Exercise(QObject *parent)
    : QObject(parent)
{
}

Exercise::Exercise(const Exercise &other)
    : QObject(other.parent())
{
    m_name = other.name();
    m_sets = other.nativeSets();
}

Exercise Exercise::operator=(const Exercise &other)
{
    setParent(other.parent());
    m_name = other.name();
    m_sets = other.nativeSets();
    return *this;
}

QString Exercise::name() const
{
    return m_name;
}

void Exercise::setName(const QString &newName)
{
    if (m_name == newName)
        return;
    m_name = newName;
}

QList<ExerciseSet> Exercise::sets() const
{
    return (m_sets);
}

QList<ExerciseSet> Exercise::nativeSets() const
{
    return m_sets;
}

void Exercise::setSets(const QList<ExerciseSet> &newSets)
{
    m_sets = newSets;
}

void Exercise::setNativeSets(const QList<ExerciseSet> &newSets)
{
    m_sets = newSets;
}

QJSValue Exercise::jsObject() const
{
    return fromNative(*this);
}

QJSValue Exercise::fromNative(const Exercise &newExercise)
{
    QJSEngine engine;
    QJSValue obj = engine.newObject();
    obj.setProperty("name", newExercise.name());
    obj.setProperty("sets", ExerciseSet::fromNativeList(newExercise.sets()));

    return obj;
}

Exercise Exercise::toNative(const QJSValue &newExercise)
{
    // QList<Exercise> ex;
    // const int length = newExercises.property("length").toInt();

    // for (int i = 0; i < length; ++i) {
    Exercise exercise;
    exercise.setName(newExercise.property("name").toString());
    exercise.setSets(ExerciseSet::toNativeList(newExercise.property("sets")));
    for (const ExerciseSet &set : exercise.sets()) {
        // qDebug() << set.reps() << set.weight();
    }
    // ex.append(exercise);
    // }

    // qDebug() << newExercise.property("sets").isUndefined();

    return exercise;

}

void Exercise::addSet()
{
    ExerciseSet set;
    m_sets.append(set);
}

void Exercise::removeSet(int idx)
{
    m_sets.removeAt(idx);
}

void Exercise::changeSet(int idx, int reps, int weight)
{
    ExerciseSet set = m_sets.at(idx);
    set.setReps(reps);
    set.setWeight(weight);
    m_sets.replace(idx, set);
}

