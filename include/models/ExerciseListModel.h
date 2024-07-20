#ifndef EXERCISELISTMODEL_H
#define EXERCISELISTMODEL_H

#include "Exercise.h"
#include <QAbstractListModel>
#include <QObject>

class ExerciseListModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
public:

    enum ELMRoleTypes
    {
        NAME = Qt::UserRole+1,
        SETS,
        ID
    };

    ExerciseListModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role) const;

    Q_INVOKABLE void add(QString name = "", QList<ExerciseSet> sets = {});
    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex());

    Q_INVOKABLE void loadData(QDate date);
    Q_INVOKABLE void saveData(QDate date);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Exercise> m_data;
};

#endif // EXERCISELISTMODEL_H
