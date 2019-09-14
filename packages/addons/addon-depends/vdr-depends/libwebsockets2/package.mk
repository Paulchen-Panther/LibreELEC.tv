# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libwebsockets2"
PKG_VERSION="2.4.2"
PKG_SHA256="73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6"
PKG_LICENSE="LGPL2+"
PKG_SITE="https://libwebsockets.org"
PKG_URL="https://github.com/warmcat/libwebsockets/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl json-c"
PKG_LONGDESC="Library for implementing network protocols with a tiny footprint."

PKG_CMAKE_OPTS_TARGET="-DLWS_WITH_STATIC=OFF \
                       -DLWS_WITH_SHARED=ON \
                       -DLWS_WITHOUT_EXTENSIONS=ON \
                       -DLWS_WITHOUT_TESTAPPS=ON"

makeinstall_target(){
 :
}
