
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(CuteLogger)

include_directories(${CMAKE_SOURCE_DIR}/CuteLogger/include)
include_directories(${CMAKE_SOURCE_DIR}/mvcp)

set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(CMAKE_MODULE_PATH ${CMAKE_PREFIX_PATH}
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Core
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Widgets
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Gui
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Svg
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Xml
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5OpenGL
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Network
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5PrintSupport
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Qml
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Quick
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5QuickWidgets
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Sql
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5WebSockets
        /opt/Qt/Qt5.7.0-linux/5.7/gcc_64/lib/cmake/Qt5Multimedia
        )
#Qt5          Qt53DQuickExtras  Qt5Concurrent         Qt5Gui                Qt5Network           Qt5Purchasing      Qt5Script       Qt5Sql         Qt5WebEngine         Qt5X11Extras
#Qt53DCore    Qt53DQuickInput   Qt5Core               Qt5Help               Qt5Nfc               Qt5Qml             Qt5ScriptTools  Qt5Svg         Qt5WebEngineCore     Qt5Xml
#Qt53DExtras  Qt53DQuickRender  Qt5DataVisualization  Qt5LinguistTools      Qt5OpenGL            Qt5Quick           Qt5Scxml        Qt5Test        Qt5WebEngineWidgets  Qt5XmlPatterns
#Qt53DInput   Qt53DRender       Qt5DBus               Qt5Location           Qt5OpenGLExtensions  Qt5QuickControls2  Qt5Sensors      Qt5UiPlugin    Qt5WebSockets
#Qt53DLogic   Qt5Bluetooth      Qt5Designer           Qt5Multimedia         Qt5Positioning       Qt5QuickTest       Qt5SerialBus    Qt5UiTools     Qt5WebView
#Qt53DQuick   Qt5Charts         Qt5Gamepad            Qt5MultimediaWidgets  Qt5PrintSupport      Qt5QuickWidgets    Qt5SerialPort   Qt5WebChannel  Qt5Widgets

message( "path in CMAKE_MODULE_PATH" )
foreach( path ${CMAKE_MODULE_PATH} )
    message( ${path} )
endforeach( path )

find_package(Qt5Core REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Svg REQUIRED)
find_package(Qt5Xml REQUIRED)
find_package(Qt5OpenGL REQUIRED)
find_package(Qt5Network REQUIRED)
find_package(Qt5PrintSupport REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Quick REQUIRED)
find_package(Qt5QuickWidgets REQUIRED)
find_package(Qt5WebSockets REQUIRED)
find_package(Qt5Sql REQUIRED)
find_package(Qt5Multimedia REQUIRED)

add_subdirectory(CuteLogger)
add_subdirectory(mvcp)
add_subdirectory(src)