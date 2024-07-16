// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "DataManager.h"
#include "Settings.h"
#include "autogen/environment.h"
// #include "items/ExerciseSet.h"

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
    DataManager data;
    // ExerciseSet set;

    engine.rootContext()->setContextProperty("settings", &settings);
    engine.rootContext()->setContextProperty("dataManager", &data);
    // engine.rootContext()->setContextProperty("exerciseSet", &set);

    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    // engine..setResizeMode(QQuickView::SizeRootObjectToView);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
