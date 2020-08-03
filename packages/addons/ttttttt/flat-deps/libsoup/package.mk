# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="libsoup"
PKG_VERSION="2.70.0"
PKG_LICENSE="LGPL"
PKG_SITE="https://wiki.gnome.org/Projects/libsoup"
PKG_URL="http://ftp.acc.umu.se/pub/gnome/sources/libsoup/2.70/libsoup-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain libpsl glib-networking sqlite"
PKG_LONGDESC="HTTP client/server library for GNOME"

PKG_MESON_OPTS_TARGET="-Dtls_check=false \
		       -Dvala=disabled \
		       -Dgssapi=disabled \
		       -Dintrospection=disabled \
		       -Dtests=false"
