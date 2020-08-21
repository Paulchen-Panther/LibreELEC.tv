# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="st-luke"
PKG_VERSION="de6fd85eeb544548ed5ad23a639eedd6af510036"
PKG_SHA256="a23f8d798b6106fc4d19a0181d3f8b9b556b8251842edde9b5a02dfeba755ac2"
PKG_ARCH="x86_64"
PKG_LICENSE="Mit"
PKG_SITE="https://st.suckless.org"
PKG_URL="https://github.com/LukeSmithxyz/st/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libXft libX11 harfbuzz"
PKG_LONGDESC="A terminal emulator with a strong focus on simplicity and performance."

make_target(){
 sed -i -e "s|^STCFLAGS.*|& -I$(get_install_dir libXft)\/usr/include|" $PKG_BUILD/config.mk
 sed -i -e "s|^STLDFLAGS.*|& -L$(get_install_dir libXft)\/usr/lib -L$(get_install_dir libXrender)\/usr/lib|"    $PKG_BUILD/config.mk
 sed -i -e "s|^X11INC.*|X11INC=\"$SYSROOT_PREFIX\/usr/include/X11\"|"  $PKG_BUILD/config.mk
 sed -i -e "s|^X11LIB.*|X11INC=\"$SYSROOT_PREFIX\/usr/lib/X11\"|"      $PKG_BUILD/config.mk
 
 make --directory="$PKG_BUILD" PREFIX="/usr"
}

makeinstall_target() {
  :
}
