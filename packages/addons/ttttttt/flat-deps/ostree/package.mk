# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (trondah@gmail.com)

PKG_NAME="ostree"
PKG_VERSION="6ed4823" # 2020.3
PKG_LICENSE="LGPL"
PKG_SITE="https://www.freedesktop.org/wiki/Software/polkit"
PKG_URL="https://github.com/ostreedev/ostree.git"
PKG_DEPENDS_TARGET="toolchain xz e2fsprogs gpgme libsoup openssl fuse"
PKG_LONGDESC="Operating system and container binary deployment and upgrades"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-experimental-api \
			   --disable-introspection \
			   --with-openssl \
			   --with-soup \
			   --with-gpgme \
			   --with-builtin-grub2-mkconfig \
			   --with-mkinitcpio"

post_unpack() {
  sed -e 's,$(libglnx_srcpath),libglnx,g' < ${PKG_BUILD}/libglnx/Makefile-libglnx.am > ${PKG_BUILD}/libglnx/Makefile-libglnx.am.inc
  sed -e 's,$(libbsdiff_srcpath),bsdiff,g' < ${PKG_BUILD}/bsdiff/Makefile-bsdiff.am > ${PKG_BUILD}/bsdiff/Makefile-bsdiff.am.inc
  cat > ${PKG_BUILD}/gtk-doc.make <<EOF
EXTRA_DIST =
CLEANFILES =
EOF
}

#pre_configure_target() {
#  cd ${PKG_BUILD}
#  rm -rf .${TARGET_NAME}
#  NOCONFIGURE=1 ac_glib_test=no ./autogen.sh
#}
