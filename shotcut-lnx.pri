unix : !mac {

    PREFIX = /home/tony/workspace_mtl/install
    MLT_PATH = $$PREFIX

    INCLUDEPATH += $$MLT_PATH/include
    LIBS += -L$$MLT_PATH/lib

}


