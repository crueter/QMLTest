// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

#include "DataManager.h"
#include "Exercise.h"
#include "Settings.h"
#include "autogen/environment.h"

#include <QQmlContext>

int main(int argc, char *argv[])
{
#ifdef Q_OS_ANDROID
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
#endif
    set_qt_environment();
    QGuiApplication app(argc, argv);
    app.setApplicationDisplayName("Sneed");

    QQmlApplicationEngine engine;

    Settings settings;
    DataManager::init();

    engine.rootContext()->setContextProperty("settings", &settings);

    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url, &engine](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);

        QObject *exercisesPage = obj->findChild<QObject*>("rootExercisePage");
        if (exercisesPage) {
            // qDebug() << exercisesPage->property("exercises").value<QQmlListModel *>();

            QQmlComponent component(&engine,
                                    QUrl("qrc:/qt/qml/SneedContent/ExerciseImpl.qml"));

            QObject *object = component.createWithInitialProperties(QVariantMap{{"name", "blud"}});

            Exercise ex;
            ex.setName("awesome");

            object->setProperty("ex", QVariant::fromValue(ex));

            QMetaObject::invokeMethod(exercisesPage, "addExercise",
                                      Q_ARG(QVariant, QVariant::fromValue(object)));
            // ...
                // delete object;
            // qDebug() << exercisesPage;
        }

    }, Qt::QueuedConnection);

    // for (QObject *obj : engine.()) {
    //     qDebug() << obj;
    // }

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
