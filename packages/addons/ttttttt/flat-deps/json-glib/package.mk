# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (trondah@gmail.com)

PKG_NAME="json-glib"
#PKG_VERSION="1.4.4"
PKG_VERSION="761de0f5"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.gnome.org"
#PKG_URL="http://ftp.gnome.org/pub/gnome/sources/json-glib/1.4/json-glib-${PKG_VERSION}.tar.xz"
PKG_URL="https://gitlab.gnome.org/GNOME/json-glib/-/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glib"
PKG_LONGDESC="JSON library built on GLib"

PKG_MESON_OPST_TARGET="-Dintrospection=disabled \
		       -Dgtk_doc=disabled \
		       -Dtests=false"
