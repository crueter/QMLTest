#ifndef EXERCISE_H
#define EXERCISE_H

#include <QObject>
#include <QQmlEngine>

#include "items/ExerciseSet.h"

class Exercise : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QJSValue sets READ sets WRITE setSets NOTIFY setsChanged)
    QML_ELEMENT

public:
    Exercise(QObject *parent = nullptr);
    Exercise(const Exercise &other);
    Exercise operator=(const Exercise &other);

    QString name() const;
    void setName(const QString &newName);

    QJSValue sets() const;
    QList<ExerciseSet> nativeSets() const;
    void setSets(const QJSValue &newSets);
    void setNativeSets(const QList<ExerciseSet> &newSets);

    static QJSValue fromNative(const QList<Exercise> &newExercises);
    static QList<Exercise> toNative(const QJSValue &newExercises);

signals:
    void nameChanged();
    void setsChanged();

private:
    QString m_name;
    QList<ExerciseSet> m_sets;
};

#endif // EXERCISE_H
