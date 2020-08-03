# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="polkit"
PKG_VERSION="3eadcff2"
PKG_LICENSE="LGPL"
PKG_SITE="https://www.freedesktop.org/wiki/Software/polkit"
PKG_URL="https://gitlab.freedesktop.org/polkit/polkit/-/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain js60"
PKG_LONGDESC="Application development toolkit for controlling system-wide privileges"

PKG_MESON_OPTS_TARGET="-Dintrospection=false \
		       -Dauthfw=shadow \
		       -Dos_type=redhat \
		       -Dsession_tracking=libsystemd-login"

post_makeinstall_target() {
  chmod 0770 ${INSTALL}/etc/polkit-1/rules.d
}

post_install() {
  add_user polkitd x 102 0 "PolicyKit daemon" "/" "/bin/false"
}
