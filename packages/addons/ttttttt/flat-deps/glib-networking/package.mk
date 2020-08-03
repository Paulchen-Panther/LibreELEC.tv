# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="glib-networking"
PKG_VERSION="2.64.2"
PKG_SHA256="45def0715c551f9b0b41a4e4f730ac95f3d5d4f3de8162260fbf9421cff695a7"
PKG_LICENSE="GPL2"
PKG_SITE="https://gitlab.gnome.org/GNOME/glib-networking"
PKG_URL="http://ftp.acc.umu.se/pub/gnome/sources/glib-networking/2.64/glib-networking-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gnutls"
PKG_LONGDESC="Network extensions for GLib"

PKG_MESON_OPTS_HOST="-Dopenssl=enabled \
		       -Dinstalled_tests=false \
		       -Dstatic_modules=false"

PKG_MESON_OPTS_TARGET="-Dgnutls=enabled \
		       -Dinstalled_tests=false \
		       -Dstatic_modules=false"
