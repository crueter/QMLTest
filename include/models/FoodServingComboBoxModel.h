#ifndef FOODSERVINGCOMBOBOXMODEL_H
#define FOODSERVINGCOMBOBOXMODEL_H

#include "FoodItem.h"
#include <QAbstractListModel>
#include <QQmlEngine>

class FoodServingComboBoxModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
public:

    enum FSMRoleTypes
    {
        NAME = Qt::UserRole+1,
        SIZE
    };

    FoodServingComboBoxModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role) const;

    Q_INVOKABLE void add(const ServingSize &size);
    Q_INVOKABLE void add(const QList<ServingSize> &sizes);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<ServingSize> m_data;
};

#endif // FOODSERVINGCOMBOBOXMODEL_H
