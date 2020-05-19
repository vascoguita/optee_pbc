CFG_TEE_TA_LOG_LEVEL ?= 4
CPPFLAGS += -DCFG_TEE_TA_LOG_LEVEL=$(CFG_TEE_TA_LOG_LEVEL)

LIBNAME = pbc

LDADD += $(TA_DEV_KIT_DIR)/lib/libgmp.a

include $(TA_DEV_KIT_DIR)/mk/ta_dev_kit.mk