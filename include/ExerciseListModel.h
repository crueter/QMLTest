#ifndef EXERCISELISTMODEL_H
#define EXERCISELISTMODEL_H

#include <QAbstractListModel>
#include <QObject>

class ExerciseListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ExerciseListModel(QObject *parent = nullptr);
};

#endif // EXERCISELISTMODEL_H
