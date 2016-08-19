include $(call all-subdir-makefiles)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto/Makefile.inc

include $(LOCAL_PATH)/3rd/openssl-1.0.2h/android-config.mk

LOCAL_SRC_FILES := $(addprefix 3rd/openssl-1.0.2h/crypto/,$(CRYPTO_SRC))

arm_cflags := -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM \
	-DBSAES_ASM -DGHASH_ASM

arm_src_files := 3rd/openssl-1.0.2h/crypto/armcap.c \
	3rd/openssl-1.0.2h/crypto/armv4cpuid.S \
	3rd/openssl-1.0.2h/crypto/bn/asm/armv4-mont.S \
	3rd/openssl-1.0.2h/crypto/bn/asm/armv4-gf2m.S \
	3rd/openssl-1.0.2h/crypto/sha/asm/sha1-armv4-large.S \
	3rd/openssl-1.0.2h/crypto/sha/asm/sha256-armv4.S \
	3rd/openssl-1.0.2h/crypto/sha/asm/sha512-armv4.S \
	3rd/openssl-1.0.2h/crypto/aes/asm/aes-armv4.S \
	3rd/openssl-1.0.2h/crypto/aes/asm/aesv8-armx.S \
	3rd/openssl-1.0.2h/crypto/aes/asm/bsaes-armv7.S \
	3rd/openssl-1.0.2h/crypto/modes/asm/ghash-armv4.S \
	3rd/openssl-1.0.2h/crypto/modes/asm/ghashv8-armx.S

#	

non_arm_src_files :=

LOCAL_SRC_FILES += $(addprefix 3rd/openssl-1.0.2h/crypto/aes/,$(AES_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/asn1/,$(ASN1_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/bf/,$(BF_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/bio/,$(BIO_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/bn/,$(BN_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/buffer/,$(BUFFER_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/camellia/,$(CAMELLIA_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/cast/,$(CAST_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/cmac/,$(CMAC_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/cms/,$(CMS_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/comp/,$(COMP_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/conf/,$(CONF_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/des/,$(DES_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/dh/,$(DH_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/dsa/,$(DSA_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/dso/,$(DSO_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ec/,$(EC_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ecdh/,$(ECDH_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ecdsa/,$(ECDSA_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/engine/,$(ENGINE_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/err/,$(ERR_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/evp/,$(EVP_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/hmac/,$(HMAC_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/idea/,$(IDEA_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/krb5/,$(KRB5_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/lhash/,$(LHASH_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/md4/,$(MD4_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/md5/,$(MD5_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/mdc2/,$(MDC2_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/modes/,$(MODES_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/objects/,$(OBJECTS_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ocsp/,$(OCSP_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/pem/,$(PEM_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/pkcs12/,$(PKCS12_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/pkcs7/,$(PKCS7_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/pqueue/,$(PQUEUE_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/rand/,$(RAND_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/rc2/,$(RC2_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/rc4/,$(RC4_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ripemd/,$(RIPEMD_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/rsa/,$(RSA_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/seed/,$(SEED_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/sha/,$(SHA_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/srp/,$(SRP_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/stack/,$(STACK_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ts/,$(TS_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/txt_db/,$(TXT_DB_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/ui/,$(UI_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/whrlpool/,$(WHRLPOOL_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/x509/,$(X509_SRC)) \
	$(addprefix 3rd/openssl-1.0.2h/crypto/x509v3/,$(X509V3_SRC))

LOCAL_C_INCLUDES += $(LOCAL_PATH)/3rd/openssl-1.0.2h \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/ssl \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto/asn1 \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto/evp \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto/modes \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/include \

ifeq ($(TARGET_ARCH),arm)
	LOCAL_SRC_FILES += $(arm_src_files)
	LOCAL_CFLAGS += $(arm_cflags)
else
	LOCAL_SRC_FILES += $(non_arm_src_files)
endif

LOCAL_MODULE:= libcrypto

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)

include $(LOCAL_PATH)/3rd/openssl-1.0.2h/ssl/Makefile.inc

include $(LOCAL_PATH)/3rd/openssl-1.0.2h/android-config.mk

LOCAL_SRC_FILES := $(addprefix 3rd/openssl-1.0.2h/ssl/,$(SSL_SRC))

LOCAL_C_INCLUDES += $(LOCAL_PATH)/3rd/openssl-1.0.2h \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/include \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/ssl \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto

LOCAL_SHARED_LIBRARIES += libcrypto

LOCAL_MODULE:= libssl

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)

include $(LOCAL_PATH)/3rd/openssl-1.0.2h/apps/Makefile.inc

include $(LOCAL_PATH)/3rd/openssl-1.0.2h/android-config.mk

LOCAL_SRC_FILES := $(addprefix 3rd/openssl-1.0.2h/apps/,$(APPS_SRC))

LOCAL_SRC_FILES += 3rd/openssl-1.0.2h/apps/openssl.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/3rd/openssl-1.0.2h \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/include \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/ssl \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/crypto

LOCAL_CFLAGS += -DMONOLITH

# These flags omit whole features from the commandline "openssl".
# However, portions of these features are actually turned on.
LOCAL_CFLAGS += -DOPENSSL_NO_DTLS1

LOCAL_SHARED_LIBRARIES += libcrypto \
	libssl

LOCAL_MODULE:= openssl

#include $(BUILD_EXECUTABLE)

CFLAGS := -Wpointer-arith -Wwrite-strings -Wunused -Winline \
 -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long \
 -Wfloat-equal -Wno-multichar -Wsign-compare -Wno-format-nonliteral \
 -Wendif-labels -Wstrict-prototypes -Wdeclaration-after-statement \
 -Wno-system-headers -DHAVE_CONFIG_H -DUSE_ARES -DBUILDING_LIBCURL

include $(CLEAR_VARS)
include $(LOCAL_PATH)/3rd/curl/lib/Makefile.inc
include $(LOCAL_PATH)/3rd/nghttp2/lib/Makefile.am

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

LOCAL_SRC_FILES += $(addprefix 3rd/nghttp2/lib/,$(OBJECTS))

LOCAL_CFLAGS += $(CFLAGS)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/3rd/curl/include/ \
	$(LOCAL_PATH)/3rd/curl/lib \
	$(LOCAL_PATH)/3rd/curl/c-ares \
	$(LOCAL_PATH)/3rd/openssl-1.0.2h/include \
	$(LOCAL_PATH)/3rd/nghttp2/lib/includes \
	$(LOCAL_PATH)/3rd/nghttp2

LOCAL_LDLIBS := -llog -landroid -lz

LOCAL_SHARED_LIBRARIES += libcrypto \
	libssl

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
