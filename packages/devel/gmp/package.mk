# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gmp"
PKG_VERSION="6.2.0"
PKG_SHA256="258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526"
PKG_LICENSE="LGPLv3+"
PKG_SITE="http://gmplib.org/"
PKG_URL="https://gmplib.org/download/gmp/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_WATCH="https://gmplib.org/download/gmp/ gmp-([\d\.]*)\.tar\.xz"
PKG_DEPENDS_HOST="ccache:host m4:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers."
PKG_BUILD_FLAGS="+pic:host"

PKG_CONFIGURE_OPTS_HOST="--enable-cxx --enable-static --disable-shared"

pre_configure_host() {
  export CPPFLAGS="$CPPFLAGS -fexceptions"
}
