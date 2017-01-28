hardware_legacy_incdir = $(includedir)/android/hardware-legacy-$(LAARID_API_VERSION)/hardware_legacy
hardware_legacy_inc_HEADERS = \
    %reldir%/AudioHardwareBase.h \
    %reldir%/AudioHardwareInterface.h \
    %reldir%/audio_policy_conf.h \
    %reldir%/AudioPolicyInterface.h \
    %reldir%/AudioPolicyManagerBase.h \
    %reldir%/AudioSystemLegacy.h \
    %reldir%/gscan.h \
    %reldir%/IMountService.h \
    %reldir%/link_layer_stats.h \
    %reldir%/power.h \
    %reldir%/qemu_tracing.h \
    %reldir%/rtt.h \
    %reldir%/tdls.h \
    %reldir%/uevent.h \
    %reldir%/wifi_config.h \
    %reldir%/wifi.h \
    %reldir%/wifi_hal.h \
    %reldir%/wifi_logger.h \
    %reldir%/wifi_nan.h \
    %reldir%/wifi_offload.h
