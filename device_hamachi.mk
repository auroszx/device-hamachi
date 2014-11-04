$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/qcom/hamachi/hamachi-vendor.mk)

LOCAL_PATH := device/qcom/hamachi
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
	device/qcom/hamachi/init/init.rc:root/init.rc \
	device/qcom/hamachi/init/init.target.rc:root/init.target.rc \
	device/qcom/hamachi/init/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/qcom/hamachi/init/ueventd.rc:root/ueventd.rc \
	device/qcom/hamachi/init/charger:root/charger \
	device/qcom/hamachi/idc/touch.idc:system/usr/idc/msg2133.idc \
	device/qcom/hamachi/idc/touch.idc:system/usr/idc/ft5x06_ts.idc \
	device/qcom/hamachi/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/qcom/hamachi/prebuilt/media_codecs.xml:system/etc/media_codecs.xml \
	device/qcom/hamachi/prebuilt/audio.conf:system/etc/bluetooth/audio.conf \
	device/qcom/hamachi/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/qcom/hamachi/prebuilt/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	device/qcom/hamachi/prebuilt/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
	device/qcom/hamachi/prebuilt/surf_keypad.kcm:system/usr/keychars/surf_keypad.kcm
	

$(call inherit-product-if-exists, vendor/qcom/hamachi/hamachi-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/qcom/common/vendor-blobs.mk)
$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS := device/qcom/hamachi/overlay

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ro.use_data_netmgrd=true \
  ro.display.colorfill=1 \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_hamachi
PRODUCT_DEVICE := hamachi
