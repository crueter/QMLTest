#ifndef RECIPELISTMODEL_H
#define RECIPELISTMODEL_H

#include "Recipe.h"
#include <QAbstractListModel>
#include <QQmlEngine>

class RecipeListModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
public:

    enum RLMRoleTypes
    {
        FOODS = Qt::UserRole+1,
        NAME,
        UNITS,
        ID
    };

    RecipeListModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    Q_INVOKABLE void add(const QList<FoodServing> &foods, const QString &name, const double servings = 1);
    Q_INVOKABLE void add(const Recipe &recipe);

    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;

    Q_INVOKABLE static void cache(const FoodItem &item);

    Qt::ItemFlags flags(const QModelIndex &index) const override;
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Q_INVOKABLE void loadData();
    Q_INVOKABLE void saveData();

    int meal() const;
    void setMeal(int newMeal);

    bool offlineSearch() const;
    void setOfflineSearch(bool newOfflineSearch);

signals:
    void mealChanged();
    void searchComplete();

protected:
    QHash<int, QByteArray> roleNames() const override;
private:
    QList<Recipe> m_data;
};

#endif // RECIPELISTMODEL_H
