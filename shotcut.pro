TEMPLATE = subdirs


SUBDIRS = CuteLogger mvcp src
#cache()
src.depends = CuteLogger mvcp


OTHER_FILES += CMakeLists.txt
