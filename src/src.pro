CONFIG   += link_prl

QT       += widgets opengl xml network printsupport qml quick sql #webkitwidgets
QT       += multimedia websockets quickwidgets
#QT       += qml-private core-private quick-private gui-private

TARGET = shotcut
TEMPLATE = app

DEFINES += Logger_STATIC

include(./src.pri)

include(../shotcut-win.pri)

DESTDIR = ../bin

INCLUDEPATH += ../CuteLogger/include ../mvcp

#debug_and_release {
#    build_pass:CONFIG(debug, debug|release) {
#        LIBS += -L../CuteLogger/debug -L../mvcp/debug
#    } else {
#        LIBS += -L../CuteLogger/release -L../mvcp/release
#    }
#} else {
#    LIBS += -L../CuteLogger -L../mvcp
#}
LIBS += -L../lib
LIBS += -lCuteLogger -lmvcp -lpthread_dll

SHOTCUT_VERSION = 6.0.0
#isEmpty(SHOTCUT_VERSION) {
#    !win32:SHOTCUT_VERSION = $$system(date "+%y.%m.%d")
#     win32:SHOTCUT_VERSION = adhoc
#}
DEFINES += SHOTCUT_VERSION=\\\"$$SHOTCUT_VERSION\\\"
#VERSION = $$SHOTCUT_VERSION

#mac {
#    TARGET = Shotcut
#    ICON = ../icons/shotcut.icns
#    QMAKE_INFO_PLIST = ../Info.plist
#    INCLUDEPATH += $$[QT_INSTALL_HEADERS]

#    # QMake from Qt 5.1.0 on OSX is messing with the environment in which it runs
#    # pkg-config such that the PKG_CONFIG_PATH env var is not set.
#    isEmpty(MLT_PREFIX) {
#        MLT_PREFIX = /opt/local
#    }
#    INCLUDEPATH += $$MLT_PREFIX/include/mlt++
#    INCLUDEPATH += $$MLT_PREFIX/include/mlt
#    LIBS += -L$$MLT_PREFIX/lib -lmlt++ -lmlt
#}
win32 {
#    CONFIG += windows rtti
    isEmpty(MLT_PATH) {
        message("MLT_PATH not set; using ..\\..\\... You can change this with 'qmake MLT_PATH=...'")
        MLT_PATH = ..\\..\\..
    }
    INCLUDEPATH += $$MLT_PATH/include/mlt++ $$MLT_PATH/include/mlt
    LIBS += -L$$MLT_PATH/lib -lmlt++ -lmlt -lopengl32
#    CONFIG(debug, debug|release) {
#        INCLUDEPATH += $$PWD/../drmingw/include
#        LIBS += -L$$PWD/../drmingw/x64/lib -lexchndl
#    }
    RC_FILE = shotcut.rc
#    message($$INCLUDEPATH)
#    message($$LIBS)
}
#unix:!mac {
#    QT += x11extras
#    CONFIG += link_pkgconfig
#    PKGCONFIG += mlt++
#    LIBS += -lX11
#}

#unix:!mac:isEmpty(PREFIX) {
#    message("Install PREFIX not set; using /usr/local. You can change this with 'qmake PREFIX=...'")
#    PREFIX = /usr/local
#}
#win32:isEmpty(PREFIX) {
#    message("Install PREFIX not set; using C:\\Projects\\Shotcut. You can change this with 'qmake PREFIX=...'")
#    PREFIX = C:\\Projects\\Shotcut
#}
#unix:target.path = $$PREFIX/bin
#win32:target.path = $$PREFIX
#INSTALLS += target

qmlfiles.files =  $$PWD/qml
qmlfiles.path = $$MODULE_BASE_OUTDIR/share/shotcut
INSTALLS += qmlfiles

#unix:!mac {
#    metainfo.files = $$PWD/../shotcut.appdata.xml
#    metainfo.path = $$PREFIX/share/metainfo
#    INSTALLS += qmlfiles
#}

#qmlfiles2build.files = $$QML_FILES
#qmlfiles2build.path = $$DESTDIR
COPIES += qmlfiles
