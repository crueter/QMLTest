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

QJSValue Exercise::sets() const
{
    return ExerciseSet::fromNative(m_sets);
}

QList<ExerciseSet> Exercise::nativeSets() const
{
    return m_sets;
}

void Exercise::setSets(const QJSValue &newSets)
{
    m_sets = ExerciseSet::toNative(newSets);
}

void Exercise::setNativeSets(const QList<ExerciseSet> &newSets)
{
    m_sets = newSets;
}

QJSValue Exercise::fromNative(const QList<Exercise> &newExercises)
{
    QJSEngine engine;
    QJSValue arr = engine.newArray(newExercises.size());
    for (int i = 0; i < newExercises.size(); ++i) {
        QJSValue obj = engine.newObject();
        obj.setProperty("name", newExercises.at(i).name());
        obj.setProperty("sets", newExercises.at(i).sets());
        arr.setProperty(i, obj);
    }

    return arr;

}

QList<Exercise> Exercise::toNative(const QJSValue &newExercises)
{
    QList<Exercise> ex;
    const int length = newExercises.property("length").toInt();

    for (int i = 0; i < length; ++i) {
        Exercise exercise;
        QJSValue obj = newExercises.property(i);
        exercise.setName(obj.property("name").toString());
        qDebug() << "Sets" << obj.property("sets").toString();
        exercise.setSets(obj.property("sets"));
        ex.append(exercise);
    }

    return ex;

}

