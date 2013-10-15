$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/alcatel/4012a/4012a-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/alcatel/4012a/overlay

LOCAL_PATH := device/alcatel/4012a
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
	device/alcatel/4012a/touch.idc:system/usr/idc/msg2133.idc \
	device/alcatel/4012a/touch.idc:system/usr/idc/ft5x06_ts.idc \
	device/alcatel/4012a/media_profiles.xml:system/etc/media_profiles.xml \
	device/alcatel/4012a/audio.conf:system/etc/bluetooth/audio.conf \
	device/alcatel/4012a/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, vendor/alcatel/4012a/4012a-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/qcom/common/vendor-blobs.mk)
$(call inherit-product, build/target/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ro.use_data_netmgrd=true \
  ro.display.colorfill=1 \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_4012a
PRODUCT_DEVICE := 4012a
