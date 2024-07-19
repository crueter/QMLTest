#include "models/FoodServingModel.h"
#include "OFPManager.h"

#include <DataManager.h>

FoodServingModel::FoodServingModel(QObject *parent)
    : QAbstractListModel{parent}
{
    m_manager = new OFPManager(this);
}


int FoodServingModel::rowCount(const QModelIndex &parent) const
{
    return m_data.size();
}

int FoodServingModel::columnCount(const QModelIndex &parent) const
{
    return 2;
}

QVariant FoodServingModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    if (role == FSMRoleTypes::ITEM) {
        return QVariant::fromValue(m_data[index.row()].item);
    } else if (role == FSMRoleTypes::SIZE) {
        return QVariant::fromValue(m_data[index.row()].size);
    } else if (role == FSMRoleTypes::UNITS) {
        return m_data[index.row()].units;
    } else if (role == FSMRoleTypes::ID) {
        return index.row();
    }

    return QVariant();
}

void FoodServingModel::loadData(QDate date)
{
    beginResetModel();
    m_data.clear();

    auto foods = DataManager::loadFoods(m_meal, date);

    m_data.append(foods);
    endResetModel();
}

void FoodServingModel::saveData(QDate date)
{
    for (const FoodServing &s : m_data) {
        DataManager::saveFood(m_meal, date, s);
    }
}

void FoodServingModel::add(const FoodItem &item, const ServingSize &size, const double units)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    FoodServing s;
    s.item = item;
    s.size = size;
    s.units = units;

    m_data << s;
    endInsertRows();
}

bool FoodServingModel::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    m_data.remove(row, count);
    endRemoveRows();

    return true;
}

void FoodServingModel::search(const QString &query)
{
    if (m_data.size() > 0) {
        removeRows(0, m_data.size(), QModelIndex());
    }
    m_manager->search(query);
    connect(m_manager, &OFPManager::searchComplete, this, [this](const QList<FoodItem> &foods) {
        for (const FoodItem &food : foods) {
            add(food, food.defaultServing(), 1);
        }

        emit searchComplete();
    });
}

QHash<int, QByteArray> FoodServingModel::roleNames() const
{
    QHash<int,QByteArray> rez;
    rez[ITEM] = "item";
    rez[SIZE] = "servingSize";
    rez[UNITS] = "units";
    rez[ID] = "foodID";
    return rez;
}

int FoodServingModel::meal() const
{
    return m_meal;
}

void FoodServingModel::setMeal(int newMeal)
{
    if (m_meal == newMeal)
        return;
    m_meal = newMeal;
    emit mealChanged();
}
