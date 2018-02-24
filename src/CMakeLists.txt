

set(target_name shotcut)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

include_directories(${CMAKE_BINARY_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

FIND_PACKAGE( Mlt COMPONENTS mlt mlt++ REQUIRED )

message(STATUS "include " ${MLT_INCLUDE_DIR})
if(WIN32)
    include_directories(${MLT_mlt++_INCLUDE_DIR}/mlt++})
    include_directories(${MLT_mlt_INCLUDE_DIR}/framework})
else(WIN32)
#    include_directories(${MLT_INCLUDE_DIRS})
    include_directories(/home/tom/workspace_qml/build/include/mlt)
endif(WIN32)

set(SHOTCUT_VERSION "2.6.5")
configure_file( ../config.in.h ${CMAKE_CURRENT_BINARY_DIR}/config.h)
include_directories(${CMAKE_BINARY_DIR}/)

set( SRCS
    main.cpp
        mainwindow.cpp
        mltcontroller.cpp
        scrubbar.cpp
        openotherdialog.cpp
        controllers/filtercontroller.cpp
        widgets/plasmawidget.cpp
        widgets/lissajouswidget.cpp
        widgets/isingwidget.cpp
        widgets/video4linuxwidget.cpp
        widgets/colorproducerwidget.cpp
        widgets/decklinkproducerwidget.cpp
        widgets/networkproducerwidget.cpp
        widgets/colorbarswidget.cpp
        widgets/countproducerwidget.cpp
        widgets/noisewidget.cpp
        widgets/pulseaudiowidget.cpp
        widgets/jackproducerwidget.cpp
        widgets/toneproducerwidget.cpp
        widgets/alsawidget.cpp
        widgets/x11grabwidget.cpp
        player.cpp
        glwidget.cpp
        widgets/servicepresetwidget.cpp
        abstractproducerwidget.cpp
        widgets/avformatproducerwidget.cpp
        widgets/imageproducerwidget.cpp
        widgets/timespinbox.cpp
        widgets/audiometerwidget.cpp
        docks/recentdock.cpp
        docks/encodedock.cpp
        dialogs/addencodepresetdialog.cpp
        jobqueue.cpp
        docks/jobsdock.cpp
        dialogs/textviewerdialog.cpp
        models/playlistmodel.cpp
        docks/playlistdock.cpp
        dialogs/durationdialog.cpp
        mvcp/qconsole.cpp
        mvcp/mvcp_socket.cpp
        mvcp/meltedclipsmodel.cpp
        mvcp/meltedunitsmodel.cpp
        mvcp/mvcpthread.cpp
        mvcp/meltedplaylistmodel.cpp
        mvcp/meltedplaylistdock.cpp
        mvcp/meltedserverdock.cpp
        widgets/colorwheel.cpp
        models/attachedfiltersmodel.cpp
        models/metadatamodel.cpp
        docks/filtersdock.cpp
        dialogs/customprofiledialog.cpp
        qmltypes/colorpickeritem.cpp
        qmltypes/colorwheelitem.cpp
        qmltypes/qmlapplication.cpp
        qmltypes/qmlfile.cpp
        qmltypes/qmlfilter.cpp
        qmltypes/qmlhtmleditor.cpp
        qmltypes/qmlmetadata.cpp
        qmltypes/timelineitems.cpp
        qmltypes/qmlprofile.cpp
    #    htmleditor/htmleditor.cpp
    #    htmleditor/highlighter.cpp
        settings.cpp
        widgets/lineeditclear.cpp
        leapnetworklistener.cpp
        widgets/webvfxproducer.cpp
        database.cpp
        widgets/gltestwidget.cpp
        models/multitrackmodel.cpp
        docks/timelinedock.cpp
        qmltypes/qmlutilities.cpp
        qmltypes/qmlview.cpp
        qmltypes/thumbnailprovider.cpp
        commands/timelinecommands.cpp
        util.cpp
        widgets/lumamixtransition.cpp
        autosavefile.cpp
        widgets/directshowvideowidget.cpp
        jobs/abstractjob.cpp
        jobs/meltjob.cpp
        jobs/encodejob.cpp
        jobs/videoqualityjob.cpp
        commands/playlistcommands.cpp
        docks/scopedock.cpp
        controllers/scopecontroller.cpp
        widgets/scopes/scopewidget.cpp
        widgets/scopes/audioloudnessscopewidget.cpp
        widgets/scopes/audiopeakmeterscopewidget.cpp
        widgets/scopes/audiospectrumscopewidget.cpp
        widgets/scopes/audiowaveformscopewidget.cpp
        widgets/scopes/videowaveformscopewidget.cpp
        sharedframe.cpp
        widgets/audioscale.cpp
        widgets/playlisttable.cpp
        widgets/playlisticonview.cpp
        commands/undohelper.cpp
        models/audiolevelstask.cpp
        mltxmlchecker.cpp
        widgets/avfoundationproducerwidget.cpp
        widgets/gdigrabwidget.cpp
        widgets/trackpropertieswidget.cpp
        widgets/timelinepropertieswidget.cpp
        jobs/ffprobejob.cpp
        jobs/ffmpegjob.cpp
        dialogs/unlinkedfilesdialog.cpp
        dialogs/transcodedialog.cpp
        transportcontrol.cpp

)

set( HEADERS
    mainwindow.h
        mltcontroller.h
        scrubbar.h
        openotherdialog.h
        controllers/filtercontroller.h
        widgets/plasmawidget.h
        abstractproducerwidget.h
        widgets/lissajouswidget.h
        widgets/isingwidget.h
        widgets/video4linuxwidget.h
        widgets/colorproducerwidget.h
        widgets/decklinkproducerwidget.h
        widgets/networkproducerwidget.h
        widgets/colorbarswidget.h
        widgets/countproducerwidget.h
        widgets/noisewidget.h
        widgets/pulseaudiowidget.h
        widgets/jackproducerwidget.h
        widgets/toneproducerwidget.h
        widgets/alsawidget.h
        widgets/x11grabwidget.h
        player.h
        glwidget.h
        widgets/servicepresetwidget.h
        widgets/avformatproducerwidget.h
        widgets/imageproducerwidget.h
        widgets/timespinbox.h
        widgets/iecscale.h
        widgets/audiometerwidget.h
        docks/recentdock.h
        docks/encodedock.h
        dialogs/addencodepresetdialog.h
        jobqueue.h
        docks/jobsdock.h
        dialogs/textviewerdialog.h
        models/playlistmodel.h
        docks/playlistdock.h
        dialogs/durationdialog.h
        mvcp/qconsole.h
        mvcp/meltedclipsmodel.h
        mvcp/meltedunitsmodel.h
        mvcp/mvcpthread.h
        mvcp/meltedplaylistmodel.h
        mvcp/meltedplaylistdock.h
        mvcp/meltedserverdock.h
        transportcontrol.h
        widgets/colorwheel.h
        models/attachedfiltersmodel.h
        models/metadatamodel.h
        docks/filtersdock.h
        dialogs/customprofiledialog.h
        qmltypes/colorpickeritem.h
        qmltypes/colorwheelitem.h
        qmltypes/qmlapplication.h
        qmltypes/qmlfile.h
        qmltypes/qmlfilter.h
        qmltypes/qmlhtmleditor.h
        qmltypes/qmlmetadata.h
        qmltypes/timelineitems.h
        qmltypes/qmlprofile.h
    #    htmleditor/htmleditor.h
    #    htmleditor/highlighter.h
        settings.h
        widgets/lineeditclear.h
        leapnetworklistener.h
        widgets/webvfxproducer.h
        database.h
        widgets/gltestwidget.h
        models/multitrackmodel.h
        docks/timelinedock.h
        qmltypes/qmlutilities.h
        qmltypes/qmlview.h
        qmltypes/thumbnailprovider.h
        commands/timelinecommands.h
        util.h
        widgets/lumamixtransition.h
        autosavefile.h
        widgets/directshowvideowidget.h
        jobs/abstractjob.h
        jobs/meltjob.h
        jobs/encodejob.h
        jobs/videoqualityjob.h
        commands/playlistcommands.h
        docks/scopedock.h
        controllers/scopecontroller.h
        widgets/scopes/scopewidget.h
        widgets/scopes/audioloudnessscopewidget.h
        widgets/scopes/audiopeakmeterscopewidget.h
        widgets/scopes/audiospectrumscopewidget.h
        widgets/scopes/audiowaveformscopewidget.h
        widgets/scopes/videowaveformscopewidget.h
        dataqueue.h
        sharedframe.h
        widgets/audioscale.h
        widgets/playlisttable.h
        widgets/playlisticonview.h
        commands/undohelper.h
        models/audiolevelstask.h
        shotcut_mlt_properties.h
        mltxmlchecker.h
        widgets/avfoundationproducerwidget.h
        widgets/gdigrabwidget.h
        widgets/trackpropertieswidget.h
        widgets/timelinepropertieswidget.h
        jobs/ffprobejob.h
        jobs/ffmpegjob.h
        dialogs/unlinkedfilesdialog.h
        dialogs/transcodedialog.h
)


set( FORMS
    mainwindow.ui
        openotherdialog.ui
        widgets/plasmawidget.ui
        widgets/lissajouswidget.ui
        widgets/isingwidget.ui
        widgets/video4linuxwidget.ui
        widgets/colorproducerwidget.ui
        widgets/decklinkproducerwidget.ui
        widgets/networkproducerwidget.ui
        widgets/colorbarswidget.ui
        widgets/countproducerwidget.ui
        widgets/noisewidget.ui
        widgets/pulseaudiowidget.ui
        widgets/jackproducerwidget.ui
        widgets/toneproducerwidget.ui
        widgets/alsawidget.ui
        widgets/x11grabwidget.ui
        widgets/servicepresetwidget.ui
        widgets/avformatproducerwidget.ui
        widgets/imageproducerwidget.ui
        docks/recentdock.ui
        docks/encodedock.ui
        dialogs/addencodepresetdialog.ui
        docks/jobsdock.ui
        dialogs/textviewerdialog.ui
        docks/playlistdock.ui
        dialogs/durationdialog.ui
        mvcp/meltedserverdock.ui
        mvcp/meltedplaylistdock.ui
        dialogs/customprofiledialog.ui
    #    htmleditor/htmleditor.ui
    #    htmleditor/inserthtmldialog.ui
        widgets/webvfxproducer.ui
        docks/timelinedock.ui
        widgets/lumamixtransition.ui
        widgets/directshowvideowidget.ui
        widgets/avfoundationproducerwidget.ui
        widgets/gdigrabwidget.ui
        widgets/trackpropertieswidget.ui
        widgets/timelinepropertieswidget.ui
        dialogs/unlinkedfilesdialog.ui
        dialogs/transcodedialog.ui
)



set( RESOURCES
        ../icons/resources.qrc
        ../other-resources.qrc
)

qt5_add_resources(QRCS ${RESOURCES})


#OTHER_FILES +=
#../COPYING
#shotcut.rc
#../scripts/build-shotcut.sh
#../icons/shotcut.icns
#../scripts/shotcut.nsi
#../Info.plist
#../icons/dark/index.theme
#../icons/light/index.theme

set( TRANSLATIONS 
    ../translations/shotcut_ca.ts
    ../translations/shotcut_cs.ts
    ../translations/shotcut_da.ts
    ../translations/shotcut_de.ts
    ../translations/shotcut_el.ts
    ../translations/shotcut_en.ts
    ../translations/shotcut_es.ts
    ../translations/shotcut_fr.ts
    ../translations/shotcut_gd.ts
    ../translations/shotcut_hu.ts
    ../translations/shotcut_it.ts
    ../translations/shotcut_ja.ts
    ../translations/shotcut_nb.ts
    ../translations/shotcut_ne.ts
    ../translations/shotcut_nl.ts
    ../translations/shotcut_oc.ts
    ../translations/shotcut_pl.ts
    ../translations/shotcut_pt_BR.ts
    ../translations/shotcut_pt_PT.ts
    ../translations/shotcut_ru.ts
    ../translations/shotcut_sk.ts
    ../translations/shotcut_sl.ts
    ../translations/shotcut_tr.ts
    ../translations/shotcut_uk.ts
    ../translations/shotcut_zh_CN.ts
    ../translations/shotcut_zh_TW.ts
)


#isEmpty(SHOTCUT_VERSION) {
#!win32:SHOTCUT_VERSION = $$system(date "+%y.%m.%d")
#win32:SHOTCUT_VERSION = adhoc
#}
#DEFINES += SHOTCUT_VERSION=\\\"$$SHOTCUT_VERSION\\\"
#VERSION = $$SHOTCUT_VERSION
#add_definitions()


#qt5_wrap_ui(uis ${FORMS})
#qt5_generate_moc( ${HEADERS} mocs)

add_executable(${target_name} ${SRCS} ${QRCS} )

target_link_libraries(${target_name} CuteLogger mvcp mlt::mlt++ mlt::mlt
        Qt5::Widgets Qt5::Core Qt5::Gui Qt5::Svg Qt5::Xml
        Qt5::OpenGL Qt5::Network Qt5::Qml Qt5::Quick Qt5::QuickWidgets Qt5::Sql
        Qt5::WebSockets Qt5::Multimedia)
target_include_directories(${target_name}
    PRIVATE ${CMAKE_CURRENT_BINARY_DIR})


#add_custom_command(
#        TARGET share_qml
#        POST_BUILD
#        COMMAND cmake -E make_directory ${CMAKE_BINARY_DIR}/../share
#        COMMAND cmake -E make_directory ${CMAKE_BINARY_DIR}/../share/shotcut
#        COMMAND cmake -E copy ${CMAKE_CURRENT_SOURCE_DIR}/qml ${CMAKE_BINARY_DIR}/../share/shotcut/
#        )

install(TARGETS ${target_name} EXPORT shotcut #install target: dll lib exe etc
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/qml 
DESTINATION share/shotcut 
)  #install dir
