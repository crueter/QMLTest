#ifndef EXERCISE_H
#define EXERCISE_H

#include <QObject>
#include <QQmlEngine>

#include "items/ExerciseSet.h"

class Exercise : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName FINAL)
    Q_PROPERTY(QList<ExerciseSet> sets READ sets WRITE setSets FINAL)
    QML_ELEMENT

public:
    explicit Exercise(QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &newName);

    QList<ExerciseSet> sets() const;
    void setSets(const QList<ExerciseSet> &newSets);

private:
    QString m_name;
    QList<ExerciseSet> m_sets;
};

#endif // EXERCISE_H
