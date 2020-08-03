# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (trondah@gmail.com)

PKG_NAME="flatpak"
PKG_VERSION="1.8.1"
PKG_SHA256="66914b66f9a64079386cc097a40a19fa8419568df7fb456f2e407f0f76ac9ead"
PKG_LICENSE="LGPL2.1"
PKG_SITE="https://github.com/flatpak/flatpak"
PKG_URL="https://github.com/flatpak/flatpak/releases/download/${PKG_VERSION}/flatpak-${PKG_VERSION}.tar.xz"
#PKG_DEPENDS_TARGET="toolchain polkit ostree json-glib gpgme appstream-glib pyparsing:host xz dconf xdg-desktop-portal elfutils patch libseccomp"
#PKG_DEPENDS_TARGET="toolchain polkit ostree gpgme appstream-glib"
PKG_DEPENDS_TARGET="toolchain libarchive libsoup gpgme"
PKG_LONGDESC="Linux application sandboxing and distribution framework"

PKG_CONFIGURE_OPTS_TARGET="--with-system-install-dir=/storage/.kodi/addons/service.flatpak/bin \
			   --with-systemd \
			   --disable-selinux-module \
			   --disable-documentation \
			   --disable-introspection \
			   --disable-seccomp \
			   --disable-xauth"
			   

post_makeinstall_target() {
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
}
