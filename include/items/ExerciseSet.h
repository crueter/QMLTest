#ifndef EXERCISESET_H
#define EXERCISESET_H

#include <QObject>
#include <QTime>
#include <QQmlEngine>

class ExerciseSet : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int reps READ reps WRITE setReps FINAL)
    Q_PROPERTY(int weight READ weight WRITE setWeight FINAL)
    // Q_PROPERTY(QTime time READ time WRITE setTime NOTIFY timeChanged FINAL)
    QML_ELEMENT

public:
    explicit ExerciseSet(QObject *parent = nullptr);
    ExerciseSet(const ExerciseSet &other);

    int reps() const;
    void setReps(int newReps);

    int weight() const;
    void setWeight(int newWeight);

    // QTime time() const;
    // void setTime(const QTime &newTime);

private:
    int m_reps;
    int m_weight;
    // QTime m_time;
};

Q_DECLARE_METATYPE(QList<ExerciseSet>)

#endif // EXERCISESET_H
