#ifndef EXERCISE_H
#define EXERCISE_H

#include "items/ExerciseSet.h"
#include <QObject>
#include <QQmlEngine>

class Exercise : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    QML_ELEMENT

public:
    explicit Exercise(QObject *parent = nullptr);

    QList<ExerciseSet *> sets() const;

    void setSets(const QList<ExerciseSet *> &newSets);

    QString name() const;
    void setName(const QString &newName);

public slots:
    void addSet();
    void deleteRequested();

    void change();

signals:
    void removeRequested();

    void dataChanged();

    void nameChanged();

private:
    QString m_name;

    QList<ExerciseSet *> m_sets;
};

#endif // EXERCISE_H
