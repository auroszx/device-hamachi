## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := 4012a

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/alcatel/4012a/device_4012a.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := 4012a
PRODUCT_NAME := cm_4012a
PRODUCT_BRAND := alcatel
PRODUCT_MODEL := 4012a
PRODUCT_MANUFACTURER := alcatel
