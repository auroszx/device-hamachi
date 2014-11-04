## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := hamachi

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/qcom/hamachi/device_hamachi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hamachi
PRODUCT_NAME := cm_hamachi
PRODUCT_BRAND := qcom
PRODUCT_MODEL := hamachi
PRODUCT_MANUFACTURER := qcom
