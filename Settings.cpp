#include "Settings.h"

#include <QSettings>
#include <QGuiApplication>

const Setting Settings::FirstRun{"firstRun", true};

const Setting Settings::Meal1Name{"meal1Name", "Meal 1"};
const Setting Settings::Meal2Name{"meal2Name", "Meal 2"};
const Setting Settings::Meal3Name{"meal3Name", "Meal 3"};
const Setting Settings::Meal4Name{"meal4Name", "Meal 4"};
const Setting Settings::Meal5Name{"meal5Name", "Meal 5"};

Settings::Settings(QObject *parent)
    : QObject(parent)
{

}

QString Settings::meal1Name() const
{
    return m_meal1Name;
}

void Settings::setMeal1Name(const QString &newMeal1Name)
{
    if (m_meal1Name == newMeal1Name)
        return;
    m_meal1Name = newMeal1Name;
    emit meal1NameChanged();
}

QString Settings::meal2Name() const
{
    return m_meal2Name;
}

void Settings::setMeal2Name(const QString &newMeal2Name)
{
    if (m_meal2Name == newMeal2Name)
        return;
    m_meal2Name = newMeal2Name;
    emit meal2NameChanged();
}

QString Settings::meal3Name() const
{
    return m_meal3Name;
}

void Settings::setMeal3Name(const QString &newMeal3Name)
{
    if (m_meal3Name == newMeal3Name)
        return;
    m_meal3Name = newMeal3Name;
    emit meal3NameChanged();
}

QString Settings::meal4Name() const
{
    return m_meal4Name;
}

void Settings::setMeal4Name(const QString &newMeal4Name)
{
    if (m_meal4Name == newMeal4Name)
        return;
    m_meal4Name = newMeal4Name;
    emit meal4NameChanged();
}

QString Settings::meal5Name() const
{
    return m_meal5Name;
}

void Settings::setMeal5Name(const QString &newMeal5Name)
{
    if (m_meal5Name == newMeal5Name)
        return;
    m_meal5Name = newMeal5Name;
    emit meal5NameChanged();
}

QVariant Setting::value() const
{
    QSettings settings(qApp);
    return settings.value(Name, DefaultValue);
}

void Setting::setValue(const QVariant &value) const
{
    QSettings settings(qApp);
    settings.setValue(Name, value);
}
