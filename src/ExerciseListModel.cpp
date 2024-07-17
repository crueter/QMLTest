#include "../include/ExerciseListModel.h"
#include "DataManager.h"

ExerciseListModel::ExerciseListModel(QObject *parent)
    : QAbstractListModel{parent}
{

}

int ExerciseListModel::rowCount(const QModelIndex &parent) const
{
    return m_data.size();
}

int ExerciseListModel::columnCount(const QModelIndex &parent) const
{
    return 2;
}

QVariant ExerciseListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    if (role == Qt::DisplayRole) {
        switch(index.column()) {
        case 0:
            return m_data[index.row()].name();
            break;
        case 1:
            return QVariant::fromValue(m_data[index.row()].sets());
            break;
        default:
            break;
        }
    } else if (role == ELMRoleTypes::NAME) {
        return m_data[index.row()].name();
    } else if (role == ELMRoleTypes::SETS) {
        return QVariant::fromValue(m_data[index.row()].sets());
    }
    else if (role == ELMRoleTypes::SETS) {
        return index.row();
    }

    return QVariant();
}

void ExerciseListModel::loadData(QDate date)
{
    beginResetModel();
    m_data.clear();

    auto exercises = DataManager::loadExercises(date);

    m_data.append(exercises);
    endResetModel();
}

void ExerciseListModel::saveData(QDate date)
{
    for (const Exercise &exercise : m_data) {
        qDebug() << exercise.name();
        DataManager::saveExercise(exercise, date);
    }
}

void ExerciseListModel::add(QString name, QList<ExerciseSet> sets)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    Exercise e;
    e.setName(name);
    e.setSets(sets);
    m_data << e;
    endInsertRows();

}

bool ExerciseListModel::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    m_data.remove(row, count);
    endRemoveRows();

    return true;
}

QHash<int, QByteArray> ExerciseListModel::roleNames() const
{
    QHash<int,QByteArray> rez;
    rez[NAME] = "name";
    rez[SETS] = "sets";
    rez[ID] = "exID";
    return rez;
}
