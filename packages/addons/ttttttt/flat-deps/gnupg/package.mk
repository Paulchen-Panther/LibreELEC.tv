# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (trondah@gmail.com)

PKG_NAME="gnupg"
PKG_VERSION="2.2.20"
PKG_SHA256="04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30"
PKG_LICENSE="GPL"
PKG_SITE="https://www.gnupg.org"
PKG_URL="https://gnupg.org/ftp/gcrypt/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libksba npth libgpg-error readline libgcrypt"
PKG_LONGDESC="Complete and free implementation of the OpenPGP standard"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-maintainer-mode \
			   --enable-symcryptrun"
pre_configure_target() {
  LDFLAGS+=" -lncurses"
}

post_makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/systemd/system
  cp ../doc/examples/systemd-user/*.{service,socket} ${INSTALL}/usr/lib/systemd/system/
}
