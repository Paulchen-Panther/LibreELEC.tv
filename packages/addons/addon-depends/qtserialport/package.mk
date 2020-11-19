# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="qtserialport"
PKG_VERSION="5.14.2"
PKG_SHA256="a6d977dd723ad4d3368b5163691405b8852f809974a96ec54103494e834aea21"
PKG_LICENSE="GPL2"
PKG_SITE="http://qt-project.org"
PKG_URL="http://download.qt.io/archive/qt/${PKG_VERSION%.*}/$PKG_VERSION/submodules/$PKG_NAME-everywhere-src-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="qtbase"
PKG_LONGDESC="A cross-platform application and UI framework."
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="-sysroot"

configure_target() {
  qmake
}
