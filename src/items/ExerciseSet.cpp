#include "items/ExerciseSet.h"

#include <QTime>

ExerciseSet::ExerciseSet(QObject *parent)
    : QObject(parent)
{
}

ExerciseSet::ExerciseSet(ExerciseSet *other)
    : QObject(other->parent())
{
    setReps(other->reps());
    setWeight(other->weight());
    setTime(other->time());
}

void ExerciseSet::remove()
{
    emit removeRequested();
}

void ExerciseSet::change()
{
    emit dataChanged();
}

QTime ExerciseSet::time() const
{
    return m_time;
}

void ExerciseSet::setTime(const QTime &newTime)
{
    if (m_time == newTime)
        return;
    m_time = newTime;
    emit timeChanged();
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
    emit weightChanged();
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
    emit repsChanged();
}
