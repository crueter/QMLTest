#include "items/Exercise.h"

Exercise::Exercise(QObject *parent)
    : QObject(parent)
{
}

void Exercise::change()
{
    emit dataChanged();
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
    emit nameChanged();
}

void Exercise::setSets(const QList<ExerciseSet *> &newSets)
{
    m_sets = newSets;

    int i = 0;
    for (ExerciseSet *set : newSets) {
        ++i;

        connect(set, &ExerciseSet::removeRequested, this, [this, set] {
            m_sets.removeOne(set);
            set->deleteLater();

            emit dataChanged();
        });

        connect(set, &ExerciseSet::dataChanged, this, &Exercise::dataChanged);

    }
}

QList<ExerciseSet *> Exercise::sets() const
{
    return m_sets;
}

