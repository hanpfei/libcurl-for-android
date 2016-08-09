include $(call all-subdir-makefiles)

LOCAL_PATH := $(call my-dir)

CFLAGS := -Wpointer-arith -Wwrite-strings -Wunused -Winline \
 -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long \
 -Wfloat-equal -Wno-multichar -Wsign-compare -Wno-format-nonliteral \
 -Wendif-labels -Wstrict-prototypes -Wdeclaration-after-statement \
 -Wno-system-headers -DHAVE_CONFIG_H -DUSE_ARES

include $(CLEAR_VARS)
include $(LOCAL_PATH)/3rd/curl/lib/Makefile.inc

#libcurl/7.45.0 c-ares/1.10.0
LOCAL_SRC_FILES := $(addprefix 3rd/curl/lib/,$(CSOURCES))

#c-ares-1.10.0 code
LOCAL_SRC_FILES += 3rd/curl/c-ares/ares__close_sockets.c \
	3rd/curl/c-ares/ares__get_hostent.c \
	3rd/curl/c-ares/ares__read_line.c \
	3rd/curl/c-ares/ares__timeval.c \
	3rd/curl/c-ares/ares_cancel.c \
	3rd/curl/c-ares/ares_create_query.c \
	3rd/curl/c-ares/ares_data.c \
	3rd/curl/c-ares/ares_destroy.c \
	3rd/curl/c-ares/ares_expand_name.c \
	3rd/curl/c-ares/ares_free_hostent.c \
	3rd/curl/c-ares/ares_free_string.c \
	3rd/curl/c-ares/ares_gethostbyname.c \
	3rd/curl/c-ares/ares_getsock.c \
	3rd/curl/c-ares/ares_init.c \
	3rd/curl/c-ares/ares_library_init.c\
	3rd/curl/c-ares/ares_llist.c \
	3rd/curl/c-ares/ares_nowarn.c \
	3rd/curl/c-ares/ares_options.c \
	3rd/curl/c-ares/ares_parse_a_reply.c \
	3rd/curl/c-ares/ares_parse_aaaa_reply.c \
	3rd/curl/c-ares/ares_process.c \
	3rd/curl/c-ares/ares_query.c \
	3rd/curl/c-ares/ares_search.c \
	3rd/curl/c-ares/ares_send.c \
	3rd/curl/c-ares/ares_strerror.c \
	3rd/curl/c-ares/ares_timeout.c \
	3rd/curl/c-ares/ares_version.c \
	3rd/curl/c-ares/bitncmp.c \
	3rd/curl/c-ares/inet_net_pton.c

LOCAL_CFLAGS += $(CFLAGS)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/3rd/curl/include/ $(LOCAL_PATH)/3rd/curl/lib $(LOCAL_PATH)/3rd/curl/c-ares 

LOCAL_LDLIBS := -llog -landroid -lz

LOCAL_COPY_HEADERS_TO := libcurl
LOCAL_COPY_HEADERS := $(addprefix 3rd/curl/include/curl/,$(HHEADERS))

LOCAL_MODULE:= libcurl

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := netjni

LOCAL_C_INCLUDES := $(LOCAL_PATH)/src \
	$(LOCAL_PATH)/3rd/curl/include/

LOCAL_SRC_FILES += 	src/HttpClient.cpp

LOCAL_SHARED_LIBRARIES += libcurl

LOCAL_LDLIBS := -llog -landroid -lz

#LOCAL_CFLAGS += -DDEBUG

include $(BUILD_SHARED_LIBRARY)
