win32 {

    MLT_PATH = E:/workspace_ffmpeg/build
    PREFIX = $$MLT_PATH

    INCLUDEPATH += $$MLT_PATH/include
    LIBS += -L$$MLT_PATH/lib

    DEFINES += _CRT_SECURE_NO_WARNINGS

}
