
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(shotcut_pro)


#set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

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
    set(CMAKE_INSTALL_PREFIX "e:/workspace_ffmpeg/install-vc")
    set(QtPath "C:/Qt/Qt5.9.0/5.9/msvc2015_64")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
        "e:/workspace_ffmpeg/build/lib/cmake/mlt")
    set(ThirdPartyPath "e:/workspace_ffmpeg/build")
    link_directories( ${ThirdPartyPath}/lib )
    include_directories(${ThirdPartyPath}/include)
    message(${ThirdPartyPath}/include)
    set(mlt_DIR "e:/workspace_ffmpeg/build/lib/cmake/mlt")
    set(mlt_root "e:/workspace_ffmpeg/build/")
else(WIN32)
    set(QtPath "/opt/Qt/Qt5.10.0/5.10.0/gcc_64/")
    foreach( so ${QtMods})
        set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH}  ${QtPath}/lib/cmake/${so})
        find_package(${so} REQUIRED)
    endforeach()
    set(CMAKE_INSTALL_PREFIX "/home/tom/workspace_qml/build")
    set(CMAKE_PREFIX_PATH  ${CMAKE_PREFIX_PATH} /home/tom/workspace_qml/build/lib/cmake/mlt)
endif(WIN32)


#set(mlt_DIR "/home/tom/workspace_qml/build/lib/cmake/mlt")
#FIND_PACKAGE( Mlt REQUIRED )
#FIND_PACKAGE( Mlt++ REQUIRED )
message(${Mlt_INCLUDE_DIR}/mlt)
#set(CMAKE_PREFIX_PATH  ${CMAKE_PREFIX_PATH} /opt/Qt/Qt5.10.0/5.10.0/gcc_64/lib/cmake/Qt5)
#message(${CMAKE_PREFIX_PATH})
#find_package(Qt5 COMPONENTS ${QtMods} REQUIRED)


message( "path in CMAKE_PREFIX_PATH" )
foreach( path ${CMAKE_PREFIX_PATH} )
#    message( ${path} )
endforeach( path )

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) #add_library(MODULE)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) #add_library(STATIC)
# Windows DLLs are "runtime" for CMake. Output them to "bin" like the Visual Studio projects do.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) #add_library(SHARED)
set(MLT_META_DATA_DIRECTORY ${CMAKE_BINARY_DIR}/share/mlt)
set(MLT_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/lib/mlt)


include_directories(${CMAKE_SOURCE_DIR}/CuteLogger/include)
include_directories(${CMAKE_SOURCE_DIR}/mvcp)
add_subdirectory(CuteLogger)
add_subdirectory(mvcp)
add_subdirectory(src)
