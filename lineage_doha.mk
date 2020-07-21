# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

VENDOR_EXCEPTION_PATHS := lineage \
    motorola \
    gapps

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/motorola/doha/device.mk)

# Inherit some common Sakura OS stuff.
IS_PHONE := true
#SAKURA_OFFICIAL := true
TARGET_BOOT_ANIMATION_RES := 1080
SAKURA_GAPPS := true
TARGET_GAPPS_ARCH := arm64
$(call inherit-product, vendor/lineage/config/common.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := lineage_doha
PRODUCT_DEVICE := doha
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g8 plus

TARGET_DEVICE := Moto G8 Plus
PRODUCT_SYSTEM_NAME := Moto G8 Plus

VENDOR_RELEASE := 9/PPIS29.65-24-2/dc7f7b:user/release-keys
BUILD_FINGERPRINT := motorola/doha_retail/doha:$(VENDOR_RELEASE)
OMNI_BUILD_FINGERPRINT := motorola/doha_retail/doha:$(VENDOR_RELEASE)
OMNI_PRIVATE_BUILD_DESC := "'doha_retail-user 10 PPIS29.65-24-2 dc7f7b release-keys'"

#PLATFORM_SECURITY_PATCH_OVERRIDE := 2019-11-01

TARGET_VENDOR := motorola

$(call inherit-product, vendor/motorola/doha/doha-vendor.mk)

ifeq ($(WITH_GAPPS),true)
# https://gitlab.com/darkobas/android_vendor_gapps
$(call inherit-product, vendor/gapps/config.mk)
endif
