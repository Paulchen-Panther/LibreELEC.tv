################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="dvb.hauppauge"
PKG_VERSION="c935349" # https://git.linuxtv.org/media_build.git/
PKG_SHA256="37a5121ee81a5f2c5380ad369058b8aa74f93d25c4bec79ee1add03b9ef6a634"

# chose media_tree http://linuxtv.org/downloads/drivers/
MEDIA_BUILD_VERSION="2017-10-17-bbae61563615"

PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://git.linuxtv.org/media_build.git"
PKG_URL="https://git.linuxtv.org/media_build.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_LONGDESC="DVB drivers for Hauppauge"
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="DVB drivers for Hauppauge"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""

  $SED -i  -e "/^LATEST_TAR/s/-LATEST/-$MEDIA_BUILD_VERSION/g" linux/Makefile
}

make_target() {
  make -C linux/ download
  make -C linux/ untar
  make VER=$KERNEL_VER SRCDIR=$(kernel_path) stagingconfig
  make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  MODULE_DIR="$INSTALL/$(get_full_module_dir $PKG_ADDON_ID)/updates/$PKG_ADDON_ID"
  ADDON_DIR="$INSTALL/usr/share/$MEDIACENTER/addons/$PKG_ADDON_ID"

  mkdir -p $MODULE_DIR
  find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $MODULE_DIR \;

  find $MODULE_DIR -name \*.ko -exec $STRIP --strip-debug {} \;

  mkdir -p $ADDON_DIR
  cp $PKG_DIR/changelog.txt $ADDON_DIR
  install_addon_files "$ADDON_DIR"
}
