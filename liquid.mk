#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
ifeq ($(TARGET_KERNEL_CONFIG),)
TARGET_PREBUILT_KERNEL := device/acer/liquid/kernel
endif # TARGET_KERNEL_CONFIG
endif # TARGET_PREBUILT_KERNEL

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/acer/liquid/init.salsa.rc:root/init.salsa.rc \
    device/acer/liquid/init.salsa.sh:root/init.salsa.sh

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/acer/liquid/liquid-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
# Additional settings used in AOSP builds
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=true \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.hw_version=1 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15

DEVICE_PACKAGE_OVERLAYS += device/acer/liquid/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/acer/liquid/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni

# Keylayouts
PRODUCT_COPY_FILES += \
    device/acer/liquid/a1-keypad.kcm.bin:system/usr/keychars/a1-keypad.kcm.bin \
    device/acer/liquid/acer-hs-butt.kcm.bin:system/usr/keychars/acer-hs-butt.kcm.bin \
    device/acer/liquid/avr.kcm.bin:system/usr/keychars/avr.kcm.bin \
    device/acer/liquid/a1-keypad.kl:system/usr/keylayout/a1-keypad.kl \
    device/acer/liquid/acer-hs-butt.kl:system/usr/keylayout/acer-hs-butt.kl \
    device/acer/liquid/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/acer/liquid/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \

# Liquid uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/acer/liquid/vold.fstab:system/etc/vold.fstab \
    device/acer/liquid/vold.conf:system/etc/vold.conf \
    device/acer/liquid/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
   device/acer/liquid/dhd.ko:system/etc/wifi/dhd.ko \
   device/acer/liquid/bcm4329.ko:system/lib/modules/bcm4329.ko

$(call inherit-product-if-exists, vendor/acer/liquid/liquid-vendor.mk)

$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := generic_liquid
PRODUCT_DEVICE := liquid
