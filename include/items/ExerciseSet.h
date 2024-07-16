#ifndef EXERCISESET_H
#define EXERCISESET_H

#include <QObject>
#include <QTime>
#include <QQmlEngine>

class ExerciseSet : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int reps READ reps WRITE setReps NOTIFY repsChanged FINAL)
    Q_PROPERTY(int weight READ weight WRITE setWeight NOTIFY weightChanged FINAL)
    Q_PROPERTY(QTime time READ time WRITE setTime NOTIFY timeChanged FINAL)
    QML_ELEMENT

public:
    explicit ExerciseSet(QObject *parent = nullptr);
    ExerciseSet(ExerciseSet *other);

    int reps() const;
    void setReps(int newReps);

    int weight() const;
    void setWeight(int newWeight);

    QTime time() const;
    void setTime(const QTime &newTime);

public slots:
    void remove();

    void change();

signals:
    void removeRequested();

    void dataChanged();

    void repsChanged();

    void weightChanged();

    void timeChanged();

private:
    int m_reps;
    int m_weight;
    QTime m_time;
};

#endif // EXERCISESET_H
