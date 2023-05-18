QT -= gui
QT += core
QT += network
QT += widgets

CONFIG += c++17 console
CONFIG -= app_bundle
CONFIG+=static

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        clientgui.cpp \
        main.cpp \
        zmqclient.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

CONFIG += link_pkgconfig
PKGCONFIG += cppzmq

HEADERS += \
    clientgui.h \
    zmqclient.h
