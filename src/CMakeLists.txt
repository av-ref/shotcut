

cmake_policy(SET CMP0020 NEW)
cmake_policy(SET CMP0071 NEW)

#QT       += multimedia websockets quickwidgets
#QT       += qml-private core-private quick-private gui-private

set(target_name shotcut)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

include_directories(${CMAKE_BINARY_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if(WIN32)
    include_directories(${mlt_root}/include)
    include_directories(${mlt_root}/include/mlt)
    include_directories(${mlt_root}/include/mlt/mlt++)
    include_directories(${mlt_root}/include/mlt/framework)
else(WIN32)
    FIND_PACKAGE( mlt COMPONENT Mlt Mlt++ REQUIRED )
    message(STATUS "include " ${Mlt_INCLUDE_DIR})
    message(STATUS "include " ${Mlt++_INCLUDE_DIR})
    include_directories(${MLT_INCLUDE_DIRS})
endif(WIN32)

set(SHOTCUT_VERSION "2.6.5")
configure_file( ../config.in.h ${CMAKE_CURRENT_BINARY_DIR}/config.h)
include_directories(${CMAKE_BINARY_DIR}/)

#SRCS
#HEADERS
#FORMS
#RESOURCES
#TRANSLATIONS
include("./CMakeLists_src.cmake")
qt5_add_resources(QRCS ${RESOURCES})
qt5_wrap_ui(uis ${FORMS})
qt5_generate_moc( ${HEADERS} mocs)

#isEmpty(SHOTCUT_VERSION) {
#!win32:SHOTCUT_VERSION = $$system(date "+%y.%m.%d")
#win32:SHOTCUT_VERSION = adhoc
#}
#DEFINES += SHOTCUT_VERSION=\\\"$$SHOTCUT_VERSION\\\"
#VERSION = $$SHOTCUT_VERSION
#add_definitions()



add_executable(${target_name} ${SRCS} ${QRCS} ${mocs} )

if(WIN32)
target_link_libraries(${target_name} CuteLogger mvcp mlt mlt++ pthread_dll
        Qt5::Widgets Qt5::Core Qt5::Gui Qt5::Svg Qt5::Xml
        Qt5::OpenGL Qt5::Network Qt5::Qml Qt5::Quick Qt5::QuickWidgets Qt5::Sql
        Qt5::WebSockets Qt5::Multimedia)
else()
    target_link_libraries(${target_name} CuteLogger mvcp mlt::mlt++ mlt::mlt pthread_dll
            Qt5::Widgets Qt5::Core Qt5::Gui Qt5::Svg Qt5::Xml
            Qt5::OpenGL Qt5::Network Qt5::Qml Qt5::Quick Qt5::QuickWidgets Qt5::Sql
            Qt5::WebSockets Qt5::Multimedia)
endif()

target_include_directories(${target_name}
    PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

#mac {
#TARGET = Shotcut
#ICON = ../icons/shotcut.icns
#QMAKE_INFO_PLIST = ../Info.plist
#
## QMake from Qt 5.1.0 on OSX is messing with the environment in which it runs
## pkg-config such that the PKG_CONFIG_PATH env var is not set.
#isEmpty(MLT_PREFIX) {
#MLT_PREFIX = /opt/local
#}
#INCLUDEPATH += $$MLT_PREFIX/include/mlt++
#INCLUDEPATH += $$MLT_PREFIX/include/mlt
#LIBS += -L$$MLT_PREFIX/lib -lmlt++ -lmlt
#}
#win32 {
#CONFIG += windows rtti
#isEmpty(MLT_PATH) {
#message("MLT_PATH not set; using ..\\..\\... You can change this with 'qmake MLT_PATH=...'")
#MLT_PATH = ..\\..\\..
#}
#INCLUDEPATH += $$MLT_PATH\\include\\mlt++ $$MLT_PATH\\include\\mlt
#LIBS += -L$$MLT_PATH\\lib -lmlt++ -lmlt -lopengl32
#CONFIG(debug, debug|release) {
#INCLUDEPATH += $$PWD/../drmingw/include
#LIBS += -L$$PWD/../drmingw/x64/lib -lexchndl
#}
#RC_FILE = shotcut.rc
#}
#unix:!mac {
#QT += x11extras
#CONFIG += link_pkgconfig
#PKGCONFIG += mlt++
#LIBS += -lX11
#}
#
#unix:!mac:isEmpty(PREFIX) {
#message("Install PREFIX not set; using /usr/local. You can change this with 'qmake PREFIX=...'")
#PREFIX = /usr/local
#}
#win32:isEmpty(PREFIX) {
#message("Install PREFIX not set; using C:\\Projects\\Shotcut. You can change this with 'qmake PREFIX=...'")
#PREFIX = C:\\Projects\\Shotcut
#}


add_custom_command(
        TARGET ${target_name}
        POST_BUILD
        COMMAND cmake -E make_directory ${CMAKE_BINARY_DIR}/../share
        COMMAND cmake -E make_directory ${CMAKE_BINARY_DIR}/../share/shotcut
        COMMAND cmake -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/qml ${CMAKE_BINARY_DIR}/../share/shotcut/
        )


install(TARGETS ${target_name} EXPORT shotcut #install target: dll lib exe etc
  LIBRARY DESTINATION lib/mlt
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/qml 
DESTINATION share/shotcut 
)  #install dir
