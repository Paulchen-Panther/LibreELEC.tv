# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (trondah@gmail.com)

PKG_NAME="appstream-glib"
PKG_VERSION="0_7_17"
PKG_LICENSE="LGPL"
PKG_SITE="https://github.com/hughsie/appstream-glib"
PKG_URL="https://github.com/hughsie/appstream-glib/archive/appstream_glib_${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glib yaml libsoup json-glib freetype fontconfig gdk-pixbuf-oem libstemmer libarchive gtk3-oem"
PKG_LONGDESC="This library provides objects and helper methods to help reading and writing AppStream metadata."

PKG_MESON_OPTS_TARGET="-Dman=false \
		       -Dintrospection=false \
		       -Drpm=false"
