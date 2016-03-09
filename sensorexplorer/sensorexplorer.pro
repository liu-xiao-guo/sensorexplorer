TEMPLATE = app
TARGET = sensorexplorer

load(ubuntu-click)

QT += qml quick sensors

SOURCES += main.cpp \
           explorer.cpp \
           sensoritem.cpp \
           propertyinfo.cpp

HEADERS = \
    explorer.h \
    sensoritem.h \
    propertyinfo.h

RESOURCES += sensorexplorer.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  sensorexplorer.apparmor \
               sensorexplorer.desktop \
               sensor.jpg

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
    TableViewProperties.qml

#specify where the config files are installed to
config_files.path = /sensorexplorer
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

