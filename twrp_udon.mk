#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/udon

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

PRODUCT_PLATFORM := taro

# Release name
PRODUCT_RELEASE_NAME := udon

## Device identifier
PRODUCT_DEVICE := udon
PRODUCT_NAME := twrp_udon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2487
PRODUCT_MANUFACTURER := OnePlus


