# Copyright 2007 The Android Open Source Project

if WITH_QEMU
libandroid_hardware_legacy_la_SOURCES += \
    %reldir%/qemu_tracing.c
endif
