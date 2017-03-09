# android-libhardware-legacy versioning
# -------------------------------------
# To make new release:
#
#   laarid_micro_version += 1
#   laarid_interface_revision += 1
#
# if any functions have been added:
#
#   laarid_micro_version += 1
#   laarid_interface_revision = 0
#
#   or
#
#   laarid_minor_version += 1
#   laarid_micro_version = 0
#   laarid_interface_revision = 0
#
# if backwards compatibility has been broken:
#
#   laarid_major_version += 1
#   laarid_minor_version = 0
#   laarid_micro_version = 0
#   laarid_interface_revision = 0
m4_define([laarid_major_version], [0])
m4_define([laarid_minor_version], [0])
m4_define([laarid_micro_version], [1])
m4_define([laarid_interface_revision], [0])
m4_define([laarid_api_version], [laarid_major_version.0])
m4_define([laarid_version],
  [laarid_major_version.laarid_minor_version.laarid_micro_version])

AC_INIT([android-libhardware-legacy], [laarid_version],
  [https://github.com/laarid/package_android-libhardware-legacy/issues], [],
  [https://github.com/laarid/package_android-libhardware-legacy])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([include/hardware_legacy/power.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects no-define tar-ustar])
AM_MAINTAINER_MODE([enable])
AM_SILENT_RULES([yes])

LAARID_MAJOR_VERSION=laarid_major_version
LAARID_MINOR_VERSION=laarid_minor_version
LAARID_MICRO_VERSION=laarid_micro_version
LAARID_API_VERSION=laarid_api_version
AC_SUBST([LAARID_MAJOR_VERSION])
AC_SUBST([LAARID_MINOR_VERSION])
AC_SUBST([LAARID_MICRO_VERSION])
AC_SUBST([LAARID_API_VERSION])

# Define _GNU_SOURCE etc. where appropriate, e.g. for strptime() on glibc
AC_USE_SYSTEM_EXTENSIONS

# Multi-arch environment
# ----------------------
AC_CANONICAL_HOST

AM_PROG_AR
AC_PROG_CC
AC_PROG_CXX

# libtool versioning
# ------------------
LT_INIT

LT_RELEASE="laarid_api_version"
AC_SUBST(LT_RELEASE)

m4_define([laarid_binary_age], [m4_eval(100 * laarid_minor_version + laarid_micro_version)])
m4_define([lt_current], [m4_eval(laarid_binary_age - laarid_interface_revision)])
m4_define([lt_revision], [laarid_interface_revision])
# Whenever backward compatibility is broken, we generate libraries of different
# release number. That follows the library files of the same release are always
# compatible, and they have their lt_age equal to lt_current.
m4_define([lt_age], [lt_current])
LT_VERSION_INFO="lt_current:lt_revision:lt_age"
AC_SUBST(LT_VERSION_INFO)

LT_OUTPUT

dnl Dependencies
dnl ------------
BIONIC_API_VERSION=0.0
BIONIC_REQUIRED_VERSION=0.1.4
AC_SUBST([BIONIC_API_VERSION])
AC_SUBST([BIONIC_REQUIRED_VERSION])
PKG_CHECK_MODULES([BIONIC], [android-bionic-$BIONIC_API_VERSION >= $BIONIC_REQUIRED_VERSION])
AC_SUBST([BIONIC_CFLAGS])
AC_SUBST([BIONIC_LIBS])

SYSTEMCORE_API_VERSION=0.0
SYSTEMCORE_REQUIRED_VERSION=0.0.12
AC_SUBST([SYSTEMCORE_API_VERSION])
AC_SUBST([SYSTEMCORE_REQUIRED_VERSION])
PKG_CHECK_MODULES([LOG], [android-log-$SYSTEMCORE_API_VERSION >= $SYSTEMCORE_REQUIRED_VERSION])
PKG_CHECK_MODULES([CUTILS], [android-cutils-$SYSTEMCORE_API_VERSION >= $SYSTEMCORE_REQUIRED_VERSION])
PKG_CHECK_MODULES([NETUTILS], [android-netutils-$SYSTEMCORE_API_VERSION >= $SYSTEMCORE_REQUIRED_VERSION])
AC_SUBST([LOG_CFLAGS])
AC_SUBST([LOG_LIBS])
AC_SUBST([CUTILS_CFLAGS])
AC_SUBST([CUTILS_LIBS])
AC_SUBST([NETUTILS_CFLAGS])
AC_SUBST([NETUTILS_LIBS])

# configure arguments
# -------------------
AC_ARG_WITH([qemu],
 [AS_HELP_STRING([--with-qemu], [use qemu hardware @<:@default=no@:>@])])
AM_CONDITIONAL([WITH_QEMU], [test x$with_qemu = xyes])

# Configure output
# ----------------
AC_CONFIG_FILES([
  Makefile
  android-hardware-legacy-$LAARID_API_VERSION.pc
])
AC_OUTPUT
