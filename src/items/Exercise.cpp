#include "items/Exercise.h"
#include "data/DataManager.h"

Exercise::Exercise(QObject *parent)
    : QObject(parent)
{
    DataManager::saveExercise(*this, QDate::currentDate());
}

Exercise::Exercise(const Exercise &other)
    : QObject(other.parent())
{
    m_name = other.name();
    m_sets = other.nativeSets();
    DataManager::saveExercise(*this, QDate::currentDate());
}

Exercise Exercise::operator=(const Exercise &other)
{
    setParent(other.parent());
    m_name = other.name();
    m_sets = other.nativeSets();
    DataManager::saveExercise(*this, QDate::currentDate());

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
    DataManager::removeExercise(*this, QDate::currentDate());
    m_name = newName;
    DataManager::saveExercise(*this, QDate::currentDate());
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

// QJSValue Exercise::fromNative(const Exercise &newExercise)
// {
//     QJSEngine engine;
//     QJSValue obj = engine.newObject();
//     obj.setProperty("name", newExercise.name());
//     obj.setProperty("sets", ExerciseSet::fromNativeList(newExercise.sets()));

//     return obj;
// }

// Exercise Exercise::toNative(const QJSValue &newExercise)
// {
//     Exercise exercise;
//     exercise.setName(newExercise.property("name").toString());
//     exercise.setSets(ExerciseSet::toNativeList(newExercise.property("sets")));

//     return exercise;
// }

void Exercise::addSet()
{
    qDebug() << "Exercise::addSet called from QML";
    ExerciseSet set;
    m_sets.append(set);

    DataManager::saveExercise(*this, QDate::currentDate());
}

void Exercise::removeSet(int idx)
{
    m_sets.removeAt(idx);
    DataManager::saveExercise(*this, QDate::currentDate());
}

void Exercise::changeSet(int idx, int reps, int weight)
{
    ExerciseSet set = m_sets.at(idx);
    set.setReps(reps);
    set.setWeight(weight);
    m_sets.replace(idx, set);

    DataManager::saveExercise(*this, QDate::currentDate());
}

void Exercise::remove()
{
    DataManager::removeExercise(*this, QDate::currentDate());
}

