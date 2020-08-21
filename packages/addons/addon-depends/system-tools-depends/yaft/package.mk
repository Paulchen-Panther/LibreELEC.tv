# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="yaft"
PKG_VERSION="e11b41bd28165e813bdb7a01a17b315205770339"
PKG_SHA256="4f087664ab6f6851b7f078c0f602118d0b3b664f3cfe4a76c83b9b60dc393872"
PKG_ARCH="x86_64"
PKG_LICENSE="Mit"
PKG_SITE="https://github.com/uobikiemukot/yaft"
PKG_URL="https://github.com/uobikiemukot/yaft/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A terminal emulator."
PKG_TOOLCHAIN="make"

make_target(){
  sed -i -e "s|-I/usr/include/X11/|-I$SYSROOT_PREFIX/usr/include/X11|g" $PKG_BUILD/makefile
  make yaftx
}

makeinstall_target() {
  :
}
