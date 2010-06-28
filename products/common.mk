# Generic cyanogenmod product
PRODUCT_NAME := cyanogen
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=edify

# Add ROMManager build property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmod

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    CMParts \
    Superuser

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/cyanogen/CHANGELOG:system/etc/CHANGELOG-CM.txt \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Allow the use of overlays
PRODUCT_PACKAGE_OVERLAYS := vendor/cyanogen/overlay

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    vendor/cyanogen/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/cyanogen/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/cyanogen/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/cyanogen/prebuilt/common/etc/profile:system/etc/profile \
    vendor/cyanogen/prebuilt/common/xbin/bash:system/xbin/bash \
    vendor/cyanogen/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/cyanogen/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/cyanogen/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/cyanogen/prebuilt/common/xbin/nano:system/xbin/nano \
    vendor/cyanogen/prebuilt/common/xbin/powertop:system/xbin/powertop

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/proprietary/RomManager.apk:system/app/RomManager.apk \

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef CYANOGEN_WITH_GOOGLE
    PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_BACKUPTOOL=False

    PRODUCT_COPY_FILES += \
        vendor/cyanogen/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
        vendor/cyanogen/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
        vendor/cyanogen/proprietary/com.amazon.mp3.apk:./system/app/com.amazon.mp3.apk \
        vendor/cyanogen/proprietary/com.google.android.apps.maps-1.apk:./system/app/com.google.android.apps.maps-1.apk \
        vendor/cyanogen/proprietary/Facebook.apk:./system/app/Facebook.apk \
        vendor/cyanogen/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
        vendor/cyanogen/proprietary/Gmail.apk:./system/app/Gmail.apk \
        vendor/cyanogen/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
        vendor/cyanogen/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
        vendor/cyanogen/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
        vendor/cyanogen/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
        vendor/cyanogen/proprietary/GoogleGoggles.apk:./system/app/GoogleGoggles.apk \
        vendor/cyanogen/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
        vendor/cyanogen/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
        vendor/cyanogen/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
        vendor/cyanogen/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
        vendor/cyanogen/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
        vendor/cyanogen/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
        vendor/cyanogen/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
        vendor/cyanogen/proprietary/kickback.apk:./system/app/kickback.apk \
        vendor/cyanogen/proprietary/LatinImeGoogle.apk:./system/app/LatinImeGoogle.apk \
        vendor/cyanogen/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
        vendor/cyanogen/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
        vendor/cyanogen/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
        vendor/cyanogen/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
        vendor/cyanogen/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
        vendor/cyanogen/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
        vendor/cyanogen/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
        vendor/cyanogen/proprietary/soundback.apk:./system/app/soundback.apk \
        vendor/cyanogen/proprietary/Street.apk:./system/app/Street.apk \
        vendor/cyanogen/proprietary/Talk.apk:./system/app/Talk.apk \
        vendor/cyanogen/proprietary/talkback.apk:./system/app/talkback.apk \
        vendor/cyanogen/proprietary/Twitter.apk:./system/app/Twitter.apk \
        vendor/cyanogen/proprietary/Vending.apk:./system/app/Vending.apk \
        vendor/cyanogen/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
        vendor/cyanogen/proprietary/YouTube.apk:./system/app/YouTube.apk \
        vendor/cyanogen/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
        vendor/cyanogen/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
        vendor/cyanogen/proprietary/libinterstitial.so:./system/lib/libinterstitial.so \
        vendor/cyanogen/proprietary/libspeech.so:./system/lib/libspeech.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif
