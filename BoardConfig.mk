#
# Copyright 2020 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := device/xiaomi/tiare/

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno308

# Bootloader
TARGET_NO_BOOTLOADER := true 
TARGET_BOOTLOADER_BOARD_NAME := msm8937

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Cmdline
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 
BOARD_KERNEL_CMDLINE += androidboot.console=ttyHSL0 androidboot.hardware=qcom androidboot.memcg=true user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78B0000 androidboot.selinux=permissive 

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/zImage-dtb
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x3000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1800000
BOARD_VENDORIMAGE_PARTITION_SIZE := 0x13e00000
# BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x52e00000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x9600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x14f1fbe00
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# Workaround for error copying vendor files to recovery ramdisk
# TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

# QCOM Support
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_tiare
TARGET_RECOVERY_DEVICE_MODULES := libinit_tiare

# Filesystem
TARGET_USES_MKE2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Encryption support
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
# TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Security Patch Hack to prevent Anti Rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_SDK_VERSION := 27

# TWRP specific build flags
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := false
TW_USE_TOOLBOX := true
TW_EXCLUDE_TWRPAPP := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
# LZMA_RAMDISK_TARGETS := recovery
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

# Debug flags
# TWRP_INCLUDE_LOGCAT := true
# TARGET_USES_LOGD := true

# Disable Mouse Cursor
TW_INPUT_BLACKLIST := "hbtp_vm"

# exFAT FS Support
# TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
# TW_INCLUDE_FUSE_NTFS := true

# If build on minimal-manifest sources
ALLOW_MISSING_DEPENDENCIES := true
