# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="faad2"
PKG_VERSION="2.8.8"
PKG_SHA256="722b9a845ebb05307e49803fd101df4bfab50aa4d3b452490ed873903fe65bcf"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/knik0/faad2"
PKG_URL="https://github.com/knik0/faad2/archive/${PKG_VERSION//./_}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="An MPEG-4 AAC decoder."

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --without-drm \
                           --with-gnu-ld \
                           --without-mpeg4ip \
                           --without-xmms"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
