
# Uncomment this if you're using STL in your project
# See CPLUSPLUS-SUPPORT.html in the NDK documentation for more information
#APP_STL := c++_static
APP_STL := gnustl_static

STLPORT_FORCE_REBUILD := true
APP_CPPFLAGS += -fexceptions -frtti

APP_ABI := armeabi armeabi-v7a
APP_PLATFORM := android-15