#ifndef FOODSERVINGMODEL_H
#define FOODSERVINGMODEL_H

#include "FoodItem.h"
#include "OFPManager.h"
#include <QAbstractListModel>
#include <QQmlEngine>

class FoodServingModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(int meal READ meal WRITE setMeal NOTIFY mealChanged FINAL)
public:

    enum FSMRoleTypes
    {
        ITEM = Qt::UserRole+1,
        SIZE,
        UNITS,
        ID,
        MEAL,
        SERVING
    };

    FoodServingModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    Q_INVOKABLE void add(const FoodItem &item, const ServingSize &size, const double units = 1);
    Q_INVOKABLE void add(const FoodServing &serving);

    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;

    Qt::ItemFlags flags(const QModelIndex &index) const override;
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Q_INVOKABLE void search(const QString &query);

    Q_INVOKABLE void loadData(QDate date);
    Q_INVOKABLE void saveData(QDate date);

    int meal() const;
    void setMeal(int newMeal);

signals:
    void mealChanged();
    void searchComplete();

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<FoodServing> m_data;

    int m_meal;

    OFPManager *m_manager;
};

#endif // FOODSERVINGMODEL_H
