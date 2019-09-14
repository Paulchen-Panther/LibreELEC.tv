# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-osd2web"
PKG_VERSION="816afd09dae421fbaf571882904b561ec77fa7f6"
PKG_SHA256="d4b0593b37160c3cefe7ec3076d05208616d72673e4036f2b7d21278ee6f8d1e"
PKG_LICENSE="GPL3"
PKG_SITE="https://github.com/horchi/vdr-plugin-osd2web"
PKG_URL="https://github.com/horchi/vdr-plugin-osd2web/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain jansson libexif libwebsockets tinyxml2 vdr"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="Allows a comfortable operation of VDR trough a web interface."
PKG_BUILD_FLAGS="-gold"

pre_configure_target() {
  CFLAGS+="-I${SYSROOT_PREFIX}/usr/include -I$(get_build_dir jansson)/.$TARGET_NAME/include"
}

pre_make_target() {
  export VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include
  export LIBDIR="/lib"
  export LOCDIR="/locale"
  export CONFDEST="/config"
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
