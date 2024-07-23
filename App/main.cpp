// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

#include "DataManager.h"
#include "CacheManager.h"
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
    app.setApplicationDisplayName("OFP");

    QQmlApplicationEngine engine;

    Settings settings;
    Recipe recipe;
    DataManager::init();
    CacheManager::init();

    engine.rootContext()->setContextProperty("settings", &settings);
    engine.rootContext()->setContextProperty("blankRecipe", QVariant::fromValue(recipe));


    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url, &engine](QObject *obj, const QUrl &objUrl) mutable {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
