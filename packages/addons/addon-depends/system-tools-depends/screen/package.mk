# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="screen"
PKG_VERSION="4.8.0"
PKG_SHA256="6e11b13d8489925fde25dfb0935bf6ed71f9eb47eff233a181e078fde5655aa1"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnu.org/software/screen/"
PKG_URL="http://ftpmirror.gnu.org/screen/$PKG_NAME-${PKG_VERSION}.tar.gz"
PKG_ID="4772"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_LONGDESC="Screen is a window manager that multiplexes a physical terminal between several processes"
PKG_BUILD_FLAGS="-sysroot -parallel"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_header_utempter_h=no \
                           --enable-colors256 \
                           --disable-pam \
                           --disable-use-locale \
                           --disable-telnet \
                           --disable-socket-dir"

