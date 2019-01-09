# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="openvfd-service"
PKG_VERSION="99b2ab997623ccc7ee6914b1b832514e36a65eda"
PKG_SHA256="23213823d1a602217c09998ec49409ca17113c2a318541cf53e9333d8e6a169b"
PKG_REV="100"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL2.0"
PKG_SITE="https://github.com/arthur-liberman/service.openvfd"
PKG_URL="https://github.com/arthur-liberman/service.openvfd/archive/$PKG_VERSION.tar.gz"
PKG_SECTION="service"
PKG_SHORTDESC="OpenVFD"
PKG_LONGDESC="Service for controlling Ethernet and WiFi status, Time, Date and Playback indicators via the Linux OpenVFD driver"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="service.openvfd"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_PROJECTS="Allwinner Amlogic Rockchip"
PKG_MAINTAINER="Team LibreELEC"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
    cp -R $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
    cp -P $PKG_DIR/icon/icon.png $ADDON_BUILD/$PKG_ADDON_ID
}
