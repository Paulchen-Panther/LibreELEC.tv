# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="gpgme"
PKG_VERSION="1.13.1"
PKG_SHA256="c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46"
PKG_LICENSE="LGPL"
PKG_SITE="https://www.gnupg.org/related_software/gpgme"
PKG_URL="https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libgpg-error:host libassuan gnupg"
PKG_LONGDESC="A C wrapper library for GnuPG"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-fd-passing \
			   --enable-languages=cpp \
			   --disable-gpgconf-test \
			   --disable-gpg-test \
			   --disable-gpgsm-test \
			   --disable-g13-test \
			   --disable-static"
