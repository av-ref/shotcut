TEMPLATE = subdirs

CONFIG += ordered

SUBDIRS = CuteLogger mvcp src
#cache()
src.depends = CuteLogger mvcp


OTHER_FILES += CMakeLists.txt
OTHER_FILES += CuteLogger/CMakeLists.txt
OTHER_FILES += mvcp/CMakeLists.txt
OTHER_FILES += src/CMakeLists.txt
