# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="iw"
PKG_VERSION="5.0.1"
PKG_SHA256="1e38ea794a223525b2ea7fe78fd14f2a56121e62e21ba5f9dbe8c494b35b5c0d"
PKG_LICENSE="GPL"
PKG_SITE="http://wireless.kernel.org/en/users/Documentation/iw"
PKG_URL="https://www.kernel.org/pub/software/network/iw/iw-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libnl"
PKG_LONGDESC="A new nl80211 based CLI configuration utility for wireless devices."

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -pthread"
}

makeinstall_target() {
  : # meh
}
