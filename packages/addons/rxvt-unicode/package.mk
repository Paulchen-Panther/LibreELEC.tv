# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rxvt-unicode"
PKG_VERSION="9.22"
PKG_SHA256="e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="http://software.schmorp.de/pkg/rxvt-unicode.html"
PKG_URL="http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libX11"
PKG_LONGDESC="A lightweight and powerful multi-tabbed X terminal emulator based on the popular rxvt."

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
  --disable-256-color \
  --enable-combining \
  --enable-font-styles \
  --enable-iso14755 \
  --enable-keepscrolling \
  --enable-next-scroll \
  --disable-perl \
  --disable-pixbuf \
  --enable-pointer-blank \
  --enable-rxvt-scroll \
  --enable-selectionscrolling \
  --enable-slipwheeling \
  --disable-smart-resize \
  --disable-startup-notification \
  --disable-transparency \
  --enable-unicode3 \
  --enable-xft \
  --enable-xim \
  --with-term=xterm \
  --enable-xterm-scroll"

makeinstall_target() {
  :
}
