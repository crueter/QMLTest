#include "ExerciseSetsModel.h"

ExerciseSetsModel::ExerciseSetsModel(QObject *parent)
    : QAbstractListModel{parent}
{

}

int ExerciseSetsModel::rowCount(const QModelIndex &parent) const
{
    return m_data.size();
}

int ExerciseSetsModel::columnCount(const QModelIndex &parent) const
{
    return 2;
}

QVariant ExerciseSetsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    if (role == Qt::DisplayRole) {
        switch(index.column()) {
        case 0:
            return m_data[index.row()].reps();
            break;
        case 1:
            return m_data[index.row()].weight();
            break;
        default:
            break;
        }
    } else if (role == ESMRoleTypes::REPS) {
        return m_data[index.row()].reps();
    } else if (role == ESMRoleTypes::WEIGHT) {
        return m_data[index.row()].weight();
    } else if (role == ESMRoleTypes::ID) {
        return index.row();
    }

    return QVariant();
}

void ExerciseSetsModel::setData(const QList<ExerciseSet> &newData)
{
    beginResetModel();
    m_data.clear();

    m_data.append(newData);
    endResetModel();
}

QList<ExerciseSet> ExerciseSetsModel::data()
{
    return m_data;
}

void ExerciseSetsModel::add(int reps, int weight)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());

    ExerciseSet s;
    s.setReps(reps);
    s.setWeight(weight);

    m_data << s;

    endInsertRows();

}

void ExerciseSetsModel::remove(int idx)
{
    m_data.remove(idx, 1);
}

bool ExerciseSetsModel::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    m_data.remove(row, count);
    endRemoveRows();

    qDebug() << row << m_data.count();

    return true;
}

QHash<int, QByteArray> ExerciseSetsModel::roleNames() const
{
    QHash<int, QByteArray> rez;
    rez[REPS] = "reps";
    rez[WEIGHT] = "weight";
    rez[ID] = "setID";
    return rez;
}
