
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(shotcut)

include_directories(${CMAKE_SOURCE_DIR}/CuteLogger/include)
include_directories(${CMAKE_SOURCE_DIR}/mvcp)

#set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(QtMods
        Qt5Core
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
    set(CMAKE_INSTALL_PREFIX "F:/github.cpp-repo/mlt_shotcut_ffmpeg/install-vc")
    set(QtPath "C:/Qt/Qt5.8.0-vc/5.8/msvc2015_64/")
    set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH}
        "F:/github.cpp-repo/mlt_shotcut_ffmpeg/install-vc/lib/cmake/mlt")
    set(ThirdPartyPath "F:/github.cpp-repo/mlt_shotcut_ffmpeg/install-vc")
    link_directories( ${ThirdPartyPath}/lib )
    INCLUDE_DIRECTORIES(${ThirdPartyPath}/include)
else(WIN32)
    set(QtPath "/opt/Qt/Qt5.10.0/5.10.0/gcc_64/")
    foreach( so ${QtMods})
        set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH}  ${QtPath}/lib/cmake/${so})
        find_package(${so} REQUIRED)
    endforeach()
    set(CMAKE_PREFIX_PATH  ${CMAKE_PREFIX_PATH} /home/tom/workspace_qml/build/lib/cmake/mlt)
endif(WIN32)

#set(CMAKE_PREFIX_PATH  ${CMAKE_PREFIX_PATH} /opt/Qt/Qt5.10.0/5.10.0/gcc_64/lib/cmake/Qt5)
#message(${CMAKE_PREFIX_PATH})
#find_package(Qt5 COMPONENTS ${QtMods} REQUIRED)


message( "path in CMAKE_MODULE_PATH" )
foreach( path ${CMAKE_PREFIX_PATH} )
    message( ${path} )
endforeach( path )

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) #add_library(MODULE)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) #add_library(STATIC)
# Windows DLLs are "runtime" for CMake. Output them to "bin" like the Visual Studio projects do.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) #add_library(SHARED)
set(MLT_META_DATA_DIRECTORY ${CMAKE_BINARY_DIR}/share/mlt)
set(MLT_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/lib/mlt)

add_subdirectory(CuteLogger)
add_subdirectory(mvcp)
add_subdirectory(src)
