#ifndef ExerciseSetsModel_H
#define ExerciseSetsModel_H

#include "ExerciseSet.h"
#include <QAbstractListModel>
#include <QObject>

class ExerciseSetsModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
public:

    enum ESMRoleTypes
    {
        REPS = Qt::UserRole + 1,
        WEIGHT,
        ID
    };

    ExerciseSetsModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role) const;

    Q_INVOKABLE void add(int reps = 0, int weight = 0);
    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex());

    Q_INVOKABLE void setData(const QList<ExerciseSet> &newData);
    Q_INVOKABLE QList<ExerciseSet> data();

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<ExerciseSet> m_data;
};

#endif // ExerciseSetsModel_H
