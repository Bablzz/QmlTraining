TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc


OTHER_FILES += \
    main.qml \
    qml/MainWindow.qml \
# Default rules for deployment.
include(deployment.pri)
