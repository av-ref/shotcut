CONFIG   += link_prl

QT       += widgets opengl xml network printsupport qml quick sql #webkitwidgets
QT       += multimedia websockets quickwidgets
#QT       += qml-private core-private quick-private gui-private

TARGET = shotcut
TEMPLATE = app

DEFINES += Logger_STATIC

include(./src.pri)

win32 : include(../shotcut-win.pri)
unix :  include(../shotcut-lnx.pri)

win32 {
DESTDIR = ../bin
}

unix: !mac {
DESTDIR = $$PREFIX/bin
}

INCLUDEPATH += ../CuteLogger/include ../mvcp

LIBS += -L../lib
LIBS += -lCuteLogger -lmvcp -lpthread

SHOTCUT_VERSION = 6.0.0

DEFINES += SHOTCUT_VERSION=\\\"$$SHOTCUT_VERSION\\\"


win32 {
    INCLUDEPATH += $$MLT_PATH/include/mlt++
    INCLUDEPATH += $$MLT_PATH/include/mlt
    LIBS += -L$$MLT_PATH/lib -lmlt++ -lmlt -lopengl32
    RC_FILE = shotcut.rc
}

#unix:!mac {
#    QT += x11extras
#    LIBS += -lX11
#    INCLUDEPATH += /usr/include/mlt
#    INCLUDEPATH += /usr/include/mlt++
#    LIBS += -L/usr/lib/x86_64-linux-gnu -lmlt -lmlt++
#}
unix : !mac {
    INCLUDEPATH += $$MLT_PATH/include/mlt++
    INCLUDEPATH += $$MLT_PATH/include/mlt
    LIBS += -L$$MLT_PATH/lib -lmlt++ -lmlt
}


unix:target.path = $$PREFIX/bin
win32:target.path = $$PREFIX/bin
INSTALLS += target

qmlfiles.files =  $$PWD/qml
qmlfiles.path = $$PREFIX/share/shotcut
INSTALLS += qmlfiles

COPIES += qmlfiles


OTHER_FILES += CMakeLists.txt
OTHER_FILES += src_orig.pro
