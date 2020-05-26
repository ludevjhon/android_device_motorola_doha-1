# Copyright (C) 2010 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

# Inherit from our custom product configuration
$(call inherit-product, vendor/aosp/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/motorola/doha/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := aosp_doha
PRODUCT_DEVICE := doha
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto g(8) plus
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=doha \

BUILD_FINGERPRINT := motorola/doha/doha:9/PPI29.65-51/d187b:user/release-keys

# Vendor Security Patch Level
VENDOR_SECURITY_PATCH := 2018-08-05

TARGET_VENDOR := motorola

$(call inherit-product, vendor/motorola/doha/doha-vendor.mk)

ifeq ($(WITH_GAPPS),true)
$(call inherit-product, vendor/gapps/config.mk)
else ifeq ($(WITH_MICROG),true)
$(call inherit-product, vendor/microg/microg.mk)
endif

ifeq ($(WITH_GAPPS),true)
#Architecture Gapps
TARGET_GAPPS_ARCH := arm64
endif
