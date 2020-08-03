# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="libpsl"
PKG_VERSION="0.21.1"
PKG_SHA256="ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/rockdaboot/libpsl"
PKG_URL="https://github.com/rockdaboot/libpsl/releases/download/${PKG_VERSION}/libpsl-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Public Suffix List library"
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--disable-runtime --disable-builtin"
