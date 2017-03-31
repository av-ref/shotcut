
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(shotcut)

include_directories(${CMAKE_SOURCE_DIR}/CuteLogger/include)
include_directories(${CMAKE_SOURCE_DIR}/mvcp)

#set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(QtMods Qt5Core
    Qt5Widgets
    Qt5Gui
    Qt5Svg
    Qt5Xml
    Qt5OpenGL
    Qt5Network
    Qt5PrintSupport
    Qt5Qml
    Qt5Quick
    Qt5QuickWidgets
    Qt5Sql
    Qt5WebSockets
    Qt5Multimedia)

if(WIN32)
    set(CMAKE_INSTALL_PREFIX "F:/github.cpp-repo/mlt_shotcut_ffmpeg/install")
    set(QtPath "C:/Qt/Qt5.8.0-mingw/5.8/mingw53_32/")
    set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH}
        "F:/github.cpp-repo/mlt_shotcut_ffmpeg/install-mlt/lib/cmake/mlt")
    set(ThirdPartyPath "F:/github.cpp-repo/mlt_shotcut_ffmpeg/install")
    link_directories( ${ThirdPartyPath}/lib )
    INCLUDE_DIRECTORIES(${ThirdPartyPath}/include)
else(WIN32)
    set(QtPath "/opt/Qt/Qt5.7.0-linux/5.7/gcc_64/")
endif(WIN32)

foreach( so ${QtMods})
    set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH}  ${QtPath}/lib/cmake/${so})
    find_package(${so} REQUIRED)
endforeach()

#Qt5          Qt53DQuickExtras  Qt5Concurrent         Qt5Gui                Qt5Network           Qt5Purchasing      Qt5Script       Qt5Sql         Qt5WebEngine         Qt5X11Extras
#Qt53DCore    Qt53DQuickInput   Qt5Core               Qt5Help               Qt5Nfc               Qt5Qml             Qt5ScriptTools  Qt5Svg         Qt5WebEngineCore     Qt5Xml
#Qt53DExtras  Qt53DQuickRender  Qt5DataVisualization  Qt5LinguistTools      Qt5OpenGL            Qt5Quick           Qt5Scxml        Qt5Test        Qt5WebEngineWidgets  Qt5XmlPatterns
#Qt53DInput   Qt53DRender       Qt5DBus               Qt5Location           Qt5OpenGLExtensions  Qt5QuickControls2  Qt5Sensors      Qt5UiPlugin    Qt5WebSockets
#Qt53DLogic   Qt5Bluetooth      Qt5Designer           Qt5Multimedia         Qt5Positioning       Qt5QuickTest       Qt5SerialBus    Qt5UiTools     Qt5WebView
#Qt53DQuick   Qt5Charts         Qt5Gamepad            Qt5MultimediaWidgets  Qt5PrintSupport      Qt5QuickWidgets    Qt5SerialPort   Qt5WebChannel  Qt5Widgets

message( "path in CMAKE_MODULE_PATH" )
foreach( path ${CMAKE_PREFIX_PATH} )
    message( ${path} )
endforeach( path )

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/mlt) #add_library(MODULE)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) #add_library(STATIC)
# Windows DLLs are "runtime" for CMake. Output them to "bin" like the Visual Studio projects do.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) #add_library(SHARED)
set(MLT_META_DATA_DIRECTORY ${CMAKE_BINARY_DIR}/share/mlt)
set(MLT_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/lib/mlt)

add_subdirectory(CuteLogger)
add_subdirectory(mvcp)
add_subdirectory(src)
