#ifndef EXERCISE_H
#define EXERCISE_H

#include "items/ExerciseSet.h"
#include <QObject>
#include <QQmlEngine>

class Exercise : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Exercise(QWidget *parent = nullptr);

    QList<ExerciseSet *> sets() const;

    void setName(const QString &name);
    QString name();

    void setSets(const QList<ExerciseSet *> &newSets);

public slots:
    void addSet();
    void deleteRequested();

    void change();

signals:
    void removeRequested();

    void dataChanged();

private:
    QList<ExerciseSet *> m_sets;
};

#endif // EXERCISE_H
