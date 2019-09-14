# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011 Anthony Nash (nash.ant@gmail.com)
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-addon"
PKG_VERSION="2.4.1"
PKG_REV="111"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain vdr vdr-plugin-ddci2 vdr-plugin-dummydevice vdr-plugin-dvbapi vdr-plugin-eepg vdr-plugin-epgfixer \
                    vdr-plugin-epgsearch vdr-plugin-iptv vdr-plugin-osd2web vdr-plugin-restfulapi vdr-plugin-robotv vdr-plugin-satip \
                    vdr-plugin-streamdev vdr-plugin-vnsiserver vdr-plugin-wirbelscan vdr-plugin-wirbelscancontrol vdr-plugin-xmltv2vdr"
PKG_SECTION="service.multimedia"
PKG_SHORTDESC="VDR: a TV streaming server for Linux"
PKG_LONGDESC="VDR (2.4.x) is a TV streaming server for Linux supporting DVB-S/S2, DVB-C, DVB-T/T2, IPTV and SAT>IP"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="VDR PVR Backend"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="pvr.vdr.vnsi:0.0.0 script.config.vdr:0.0.0"

addon() {
  # create dirs
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/{bin,lib,plugin}
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/epgsources
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/{eepg,epgfixer,epgsearch,osd2web,streamdev-server,vnsiserver}
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/res/plugins/restfulapi

  # configs
  touch $ADDON_BUILD/$PKG_ADDON_ID/config/channels.conf
  echo '0.0.0.0/0' >> $ADDON_BUILD/$PKG_ADDON_ID/config/svdrphosts.conf

  cp -P $(get_build_dir vdr)/{diseqc.conf,keymacros.conf,scr.conf,sources.conf,svdrphosts.conf} $ADDON_BUILD/$PKG_ADDON_ID/config
  cp -P $(get_build_dir vdr-plugin-epgfixer)/epgfixer/*.conf $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/epgfixer
  cp -P $(get_build_dir vdr-plugin-streamdev)/streamdev-server/streamdevhosts.conf $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/streamdev-server
  cp -P $(get_build_dir vdr-plugin-vnsiserver)/vnsiserver/allowed_hosts.conf $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/vnsiserver

  # copy static files
  cp -PR $(get_build_dir vdr-plugin-restfulapi)/web/* \
         $(get_build_dir vdr-plugin-restfulapi)/API.html \
         $ADDON_BUILD/$PKG_ADDON_ID/res/plugins/restfulapi

  cp -P $(get_build_dir vdr-plugin-xmltv2vdr)/dist/epgdata2xmltv/epgdata2xmltv.dist $ADDON_BUILD/$PKG_ADDON_ID/config/epgsources/epgdata2xmltv

  # copy binaries
  for pkg in ddci2 dummydevice dvbapi eepg epgfixer epgsearch iptv osd2web restfulapi robotv satip vnsiserver wirbelscan wirbelscancontrol xmltv2vdr; do
    cp -PR $(get_build_dir vdr-plugin-$pkg)/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/plugin
  done

  cp -P $(get_build_dir vdr-plugin-streamdev)/client/libvdr*.so.* \
        $(get_build_dir vdr-plugin-streamdev)/server/libvdr*.so.* \
        $ADDON_BUILD/$PKG_ADDON_ID/plugin

  cp -P $(get_build_dir vdr)/vdr $ADDON_BUILD/$PKG_ADDON_ID/bin/vdr.bin

  cp -P $(get_build_dir vdr-plugin-xmltv2vdr)/dist/epgdata2xmltv/epgdata2xmltv $ADDON_BUILD/$PKG_ADDON_ID/bin

  # osd2web
  cp -R $(get_build_dir vdr-plugin-osd2web)/.install_pkg/config/http $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/osd2web

  cp -L $(get_build_dir jansson)/.install_pkg/usr/lib/libjansson.so.4 \
        $(get_build_dir libexif)/.install_pkg/usr/lib/libexif.so.12 \
        $(get_build_dir libwebsockets2)/.$TARGET_NAME/lib/libwebsockets.so.12 \
        $(get_build_dir vdr-tinyxml)/.install_pkg/usr/lib/libtinyxml2.so.7 \
        $ADDON_BUILD/$PKG_ADDON_ID/lib
}
