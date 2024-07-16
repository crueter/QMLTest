#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include "FoodItem.h"
#include "Recipe.h"

#include <QDir>

class Exercise;

class DataManager
{
public:
    DataManager();

    enum DataError {
        Success,
        Failure,
        NoOp
    };

    DataError removeFood(int meal, QDate date, const FoodServing &food);
    DataError saveFood(int meal, QDate date, const FoodServing &food);
    QList<FoodServing> loadFoods(int meal, QDate date);

    DataError removeRecipe(const Recipe &recipe);
    DataError saveRecipe(const Recipe &recipe);
    QList<Recipe> loadRecipes();

    DataError saveExercises(QList<Exercise> exercises, QDate date);
    QList<Exercise> loadExercises(QDate date);

    DataError saveInfo(QString field, QVariant data);
    QVariantMap loadInfo();
    QVariant getInfo(const QString &field);

private:
    QDir dataDir;

    DataError addJsonObject(QFile &file, const QJsonObject &obj);
};

#endif // DATAMANAGER_H
