# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="irssi"
PKG_VERSION="1.2.0"
PKG_SHA256="1643fca1d8b35e5a5d7b715c9c889e1e9cdb7e578e06487901ea959e6ab3ebe5"
PKG_LICENSE="GPL"
PKG_SITE="http://www.irssi.org/"
PKG_URL="https://github.com/irssi/irssi/releases/download/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain glib ncurses openssl"
PKG_LONGDESC="Irssi is a terminal based IRC client for UNIX systems."

PKG_CONFIGURE_OPTS_TARGET="--with-sysroot=$SYSROOT_PREFIX \
        --disable-glibtest \
        --without-socks \
        --with-textui \
        --without-bot \
        --without-proxy \
        --without-perl"

pre_configure_target() {
  export CFLAGS="$CFLAGS -I$PKG_BUILD"
}

makeinstall_target() {
  :
}
