#include "items/ExerciseSet.h"

#include <QTime>
#include <QJSValue>

ExerciseSet::ExerciseSet(QObject *parent)
    : QObject(parent)
{
}

ExerciseSet::ExerciseSet(const ExerciseSet &other)
    : QObject(other.parent())
{
    setReps(other.reps());
    setWeight(other.weight());
    // setTime(other->time());
}

ExerciseSet ExerciseSet::operator=(const ExerciseSet &other)
{
    setParent(other.parent());
    setReps(other.reps());
    setWeight(other.weight());

    return *this;
}

int ExerciseSet::weight() const
{
    return m_weight;
}

void ExerciseSet::setWeight(int newWeight)
{
    if (m_weight == newWeight)
        return;
    m_weight = newWeight;
    // emit weightChanged();
}

QJSValue ExerciseSet::fromNative(const QList<ExerciseSet> &newSets)
{
    QJSEngine engine;
    QJSValue arr = engine.newArray(newSets.size());
    for (int i = 0; i < newSets.size(); ++i) {
        QJSValue obj = engine.newObject();
        obj.setProperty("reps", newSets.at(i).reps());
        obj.setProperty("weight", newSets.at(i).weight());
        arr.setProperty(i, obj);
    }

    return arr;
}

QList<ExerciseSet> ExerciseSet::toNative(const QJSValue &newSets)
{
    QList<ExerciseSet> sets;
    const int length = newSets.property("length").toInt();
    for (int i = 0; i < length; ++i) {
        ExerciseSet set;
        QJSValue obj = newSets.property(i);
        set.setReps(obj.property("reps").toInt());
        set.setWeight(obj.property("weight").toInt());
        sets.append(set);
    }

    return sets;
}

int ExerciseSet::reps() const
{
    return m_reps;
}

void ExerciseSet::setReps(int newReps)
{
    if (m_reps == newReps)
        return;
    m_reps = newReps;
    // emit repsChanged();
}
