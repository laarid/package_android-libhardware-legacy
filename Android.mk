# Copyright 2006 The Android Open Source Project

lib_LTLIBRARIES += \
    %reldir%/libandroid-hardware-legacy.la

%canon_reldir%_libandroid_hardware_legacy_la_SOURCES =

%canon_reldir%_libandroid_hardware_legacy_la_LIBADD = \
    $(LOG_LIBS) \
    $(CUTILS_LIBS)

%canon_reldir%_libandroid_hardware_legacy_la_LDFLAGS = \
    $(AM_LDFLAGS) \
    $(libtool_opts)

%canon_reldir%_libandroid_hardware_legacy_la_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(LOG_CFLAGS) \
    $(CUTILS_CFLAGS)

if WITH_QEMU
%canon_reldir%_libandroid_hardware_legacy_la_CPPFLAGS += \
    -DQEMU_HARDWARE
endif

%canon_reldir%_libandroid_hardware_legacy_la_CFLAGS = \
    $(AM_CFLAGS) \
    -Wno-unused-parameter

include $(srcdir)/%reldir%/power/Android.mk
include $(srcdir)/%reldir%/uevent/Android.mk
include $(srcdir)/%reldir%/wifi/Android.mk
include $(srcdir)/%reldir%/qemu/Android.mk
include $(srcdir)/%reldir%/qemu_tracing/Android.mk

pkgconfig_DATA += \
	android-hardware-legacy-$(LAARID_API_VERSION).pc

lib_LTLIBRARIES += \
    %reldir%/libandroid-power.la

%canon_reldir%_libandroid_power_la_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(LOG_CFLAGS) \
    $(CUTILS_CFLAGS)
%canon_reldir%_libandroid_power_la_SOURCES = \
    %reldir%/power/power.c
%canon_reldir%_libandroid_power_la_LIBADD = \
    $(CUTILS_LIBS)
%canon_reldir%_libandroid_power_la_LDFLAGS = \
    $(AM_LDFLAGS) \
    $(libtool_opts)
