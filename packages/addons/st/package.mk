# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="st"
PKG_VERSION="0.8.4"
PKG_SHA256="d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
PKG_ARCH="x86_64"
PKG_LICENSE="Mit"
PKG_SITE="https://st.suckless.org"
PKG_URL="https://dl.suckless.org/st/st-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libXft"
PKG_LONGDESC="A terminal emulator with a strong focus on simplicity and performance."

make_target(){
 sed -i -e "s|^STCFLAGS.*|& -I$(get_install_dir libXft)\/usr/include|" $PKG_BUILD/config.mk
 sed -i -e "s|^STLDFLAGS.*|& -L$(get_install_dir libXft)\/usr/lib -L$(get_install_dir libXrender)\/usr/lib|"    $PKG_BUILD/config.mk
 sed -i -e "s|'-lXft \'|'-lXft -lXrender \'|g"   $PKG_BUILD/config.mk
 sed -i -e "s|^X11INC.*|X11INC=\"$SYSROOT_PREFIX\/usr/include/X11\"|"  $PKG_BUILD/config.mk
 sed -i -e "s|^X11LIB.*|X11INC=\"$SYSROOT_PREFIX\/usr/lib/X11\"|"      $PKG_BUILD/config.mk
 
 make --directory="$PKG_BUILD" PREFIX="/usr"
}

makeinstall_target() {
  :
}
