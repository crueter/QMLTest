#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include "FoodItem.h"
#include "Recipe.h"
#include "qjsvalue.h"
#include "qqmlintegration.h"

#include <QDir>

class Exercise;/**/

class DataManager : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    DataManager(QObject *parent = nullptr);

    enum DataError {
        Success,
        Failure,
        NoOp
    };

public slots:

    DataError removeFood(int meal, QDate date, const FoodServing &food);
    DataError saveFood(int meal, QDate date, const FoodServing &food);
    QList<FoodServing> loadFoods(int meal, QDate date);

    DataError removeRecipe(const Recipe &recipe);
    DataError saveRecipe(const Recipe &recipe);
    QList<Recipe> loadRecipes();

    DataError saveExercise(QJSValue exercise, QDate date);
    QList<Exercise> loadExercises(QDate date);

    DataError saveInfo(QString field, QVariant data);
    QVariantMap loadInfo();
    QVariant getInfo(const QString &field);

private:
    QDir dataDir;

    DataError addJsonObject(QFile &file, const QJsonObject &obj);
};

#endif // DATAMANAGER_H
