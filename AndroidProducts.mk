PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/device.mk \
    $(LOCAL_DIR)/aosp_doha.mk

COMMON_LUNCH_CHOICES := \
    lineage_doha-user \
    lineage_doha-userdebug \
    lineage_doha-eng \

device: device/motorola/doha
vendor: vendor/motorola/doha
kernel: kernel/motorola/trinket
