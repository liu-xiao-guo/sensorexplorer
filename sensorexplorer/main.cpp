#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

#include "explorer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<QSensorExplorer>("SensorExplorer", 1, 0, "SensorExplorer");
    qmlRegisterType<QSensorItem>("SensorExplorer", 1, 0, "SensorItem");
    qmlRegisterType<QPropertyInfo>("SensorExplorer", 1, 0, "PropertyInfo");

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:///Main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();
    return app.exec();
}

