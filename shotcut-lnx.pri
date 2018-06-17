unix : !mac {

    PREFIX = /home/tony/ws_mm/install
    MLT_PATH = $$PREFIX

    INCLUDEPATH += $$MLT_PATH/include
    LIBS += -L$$MLT_PATH/lib

}


