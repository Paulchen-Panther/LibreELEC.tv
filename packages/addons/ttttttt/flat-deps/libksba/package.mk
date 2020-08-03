# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (trondah@gmail.com)

PKG_NAME="libksba"
PKG_VERSION="1.3.5"
PKG_SHA256="41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
PKG_LICENSE="GPL"
PKG_SITE="https://www.gnupg.org/related_software/libksba/index.html"
PKG_URL="https://www.gnupg.org/ftp/gcrypt/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain gnutls ncurses readline"
PKG_LONGDESC="A CMS and X.509 access library"

configure_package() {
  PKG_CONFIGURE_OPTS_TARGET="--with-gpg-error-prefix=${SYSROOT_PREFIX}/usr"
}
