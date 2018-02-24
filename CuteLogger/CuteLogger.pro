QT       -= gui

TARGET = CuteLogger
TEMPLATE = lib
CONFIG += create_prl
CONFIG += staticlib

DESTDIR = ../lib

DEFINES += CUTELOGGER_LIBRARY Logger_STATIC

INCLUDEPATH +=  $$PWD/include

win32 : include( $$PWD/../shotcut-win.pri)

SOURCES += $$PWD/src/Logger.cpp \
            $$PWD/src/AbstractAppender.cpp \
            $$PWD/src/AbstractStringAppender.cpp \
            $$PWD/src/ConsoleAppender.cpp \
            $$PWD/src/FileAppender.cpp \
            $$PWD/src/RollingFileAppender.cpp

HEADERS +=  $$PWD/include/Logger.h \
            $$PWD/include/CuteLogger_global.h \
            $$PWD/include/AbstractAppender.h \
            $$PWD/include/AbstractStringAppender.h \
            $$PWD/include/ConsoleAppender.h \
            $$PWD/include/FileAppender.h \
            $$PWD/include/RollingFileAppender.h

win32 {
    SOURCES +=  $$PWD/src/OutputDebugAppender.cpp
    HEADERS +=  $$PWD/include/OutputDebugAppender.h
}

android {
    SOURCES +=  $$PWD/src/AndroidAppender.cpp
    HEADERS +=  $$PWD/include/AndroidAppender.h
}
OTHER_FILES += CMakeLists.txt
