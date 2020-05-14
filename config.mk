# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/pixelstyle

# Prebuilt Packages
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt2019Static \
    PixelThemesStub2019 \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt \
    GooglePermissionControllerOverlay \
    OPScreenRecorder

# Overlay Packages
PRODUCT_PACKAGES += \
    AncientIconShapeHexagon \
    AncientIconShapeLeaf \
    AncientIconShapeSammy \
    AncientIconShapeTeardrop \
    AncientCenterClockAndroid \
    AncientCenterClockLauncher \
    AncientCenterClockSettings \
    AncientCenterClockSystemUI \
    AncientCenterClockThemePicker \
    AncientRightClockAndroid \
    AncientRightClockLauncher \
    AncientRightClockSettings \
    AncientRightClockSystemUI \
    AncientRightClockThemePicker \
    IconShapeAncientBall \
    IconShapeAncientBalloon \
    IconShapeAncientCandy \
    IconShapeAncientCloud \
    IconShapeAncientCup \
    IconShapeAncientQuatrefoil \
    IconShapeAncientQuintafoil \
    IconShapeAncientTwelveStarsStripes \
    IconShapeAncientYinYang \
    PrimaryColorAlmostBlack \
    PrimaryColorAncient \
    PrimaryColorAncientBlack \
    PrimaryColorAncientClear \
    PrimaryColorAncientCocolate \
    PrimaryColorAncientDeepRed \
    PrimaryColorAncientGrey \
    PrimaryColorAncientPastel \
    PrimaryColorDarkBlue \
    PrimaryColorEyeSoother \
    PrimaryColorNature \
    PrimaryColorOcean \
    AncientIconShapeClover \
    AncientIconShapeFourEdge \
    AncientIconShapeShurikenStars \
    ChromeOverlay \
    ContactOverlay \
    DialerOverlay \
    IconPackAnci1Android \
    IconPackAnci1PixelLauncher \
    IconPackAnci1PixelThemePicker \
    IconPackAnci1Settings \
    IconPackAnci1SystemUI \
    IconPackAnci2Android \
    IconPackAnci2PixelLauncher \
    IconPackAnci2PixelThemePicker \
    IconPackAnci2Settings \
    IconPackAnci2SystemUI \
    IconPackCircularAndroid \
    IconPackCircularSystemUI \
    MessagingOverlay \
    TelegramOverlay \
    VanillaContact \
    VanillaDialer \
    VanillaMessaging \
    WhatsAppOverlay

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuiltPixel4
endif

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "PixelStyle: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "PixelStyle: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

# Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# Gboard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

# SetupWizard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.rotation_locked=true \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=false

# StorageManager configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.storage_manager.show_opt_in=false

# OPA configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Google legal
PRODUCT_PRODUCT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

# Google Play services configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# CarrierSettings, replace CarrierConfig
PRODUCT_PACKAGES += \
    CarrierSettings

#
# Carrier configs by Google, parsed by CarrierSettings
#
# Carrier List
PRODUCT_PACKAGES += \
    carrier_list.pb

# Defaults
PRODUCT_PACKAGES += \
    default.pb

# Australia
PRODUCT_PACKAGES += \
    optus_au.pb \
    telstra_au.pb \
    vodafone_au.pb

# Canada
PRODUCT_PACKAGES += \
    bell_ca.pb \
    fido_ca.pb \
    fizz_ca.pb \
    freedommobile_ca.pb \
    koodo_ca.pb \
    luckymobile_ca.pb \
    pcmobilebell_ca.pb \
    rogers_ca.pb \
    solomobile_ca.pb \
    telus_ca.pb \
    videotron_ca.pb \
    virgin_ca.pb

# France
PRODUCT_PACKAGES += \
    bouygues_fr.pb \
    orange_fr.pb \
    sfr_fr.pb

# Germany
PRODUCT_PACKAGES += \
    o2_de.pb \
    telekom_de.pb \
    vodafone_de.pb

# India
PRODUCT_PACKAGES += \
    airtel_in.pb \
    idea_in.pb \
    rjio_in.pb \
    vodafone_in.pb

# Italy
PRODUCT_PACKAGES += \
    vodafone_it.pb

# Japan
PRODUCT_PACKAGES += \
    docomo_jp.pb \
    kddi_jp.pb \
    rakuten_jp.pb \
    softbank_jp.pb

# Netherlands
PRODUCT_PACKAGES += \
    vodafone_nl.pb

# Singapore
PRODUCT_PACKAGES += \
    singtel_sg.pb \
    starhub_sg.pb

# Spain
PRODUCT_PACKAGES += \
    orange_es.pb \
    vodafone_es.pb

# Taiwan
PRODUCT_PACKAGES += \
    cht_tw.pb \
    fet_tw.pb \
    twm_tw.pb

# United Kingdom
PRODUCT_PACKAGES += \
    ee_gb.pb \
    h3_gb.pb \
    idmobile_gb.pb \
    o2postpaid_gb.pb \
    o2prepaid_gb.pb \
    vodafone_gb.pb

# United States
PRODUCT_PACKAGES += \
    att5g_us.pb \
    att_us.pb \
    cellcom_us.pb \
    cricket5g_us.pb \
    cricket_us.pb \
    cspire_us.pb \
    firstnetpacific_us.pb \
    firstnet_us.pb \
    fi_us.pb \
    sprint_us.pb \
    sprintwholesale_us.pb \
    tmobile_us.pb \
    uscc_us.pb \
    verizon_us.pb \
    visible_us.pb \
    xfinity_us.pb

# Other countries
PRODUCT_PACKAGES += \
    others.pb

# Include product overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Inherit from audio config
$(call inherit-product, vendor/pixelstyle/config/audio.mk)

# Inherit from fonts config
$(call inherit-product, vendor/pixelstyle/config/fonts.mk)
