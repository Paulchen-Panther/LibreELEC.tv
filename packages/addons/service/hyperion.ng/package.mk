# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018 CoreELEC (https://coreelec.org)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="hyperion.ng"
PKG_VERSION="1860f6166c1883827ea3ffcfb0181b2389550f6d"
PKG_SHA256="6b2505c8099d3cbbd2c561b47c6f63992a2acfb01d19093573d93ee07bc9a2c9"
PKG_REV="100"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/hyperion-project/hyperion.ng"
PKG_URL="https://github.com/hyperion-project/hyperion.ng/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain avahi libusb protobuf Python3 qt-everywhere"
PKG_SECTION="service"
PKG_SHORTDESC="Hyperion.NG: an AmbiLight controller"
PKG_LONGDESC="Hyperion.NG($PKG_VERSION) is an modern opensource AmbiLight implementation."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Hyperion.NG"
PKG_ADDON_TYPE="xbmc.service"

# Setting default values
PKG_PLATFORM="-DPLATFORM=x86"
PKG_AMLOGIC_SUPPORT="-DENABLE_AMLOGIC=0"
PKG_DISPMANX_SUPPORT="-DENABLE_DISPMANX=0"
PKG_FB_SUPPORT="-DENABLE_FB=1"
PKG_X11_SUPPORT="-DENABLE_X11=0"
PKG_DENABLE_WS281XPWM="-DENABLE_WS281XPWM=0"

if [ "$KODIPLAYER_DRIVER" = "libamcodec" ]; then
  PKG_PLATFORM="-DPLATFORM=amlogic"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libamcodec"
  PKG_AMLOGIC_SUPPORT="-DENABLE_AMLOGIC=1"
elif [ "$KODIPLAYER_DRIVER" = "bcm2835-driver" ]; then
  PKG_PLATFORM="-DPLATFORM=rpi"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bcm2835-driver rpi_ws281x"
  PKG_DISPMANX_SUPPORT="-DENABLE_DISPMANX=1"
  PKG_FB_SUPPORT="-DENABLE_FB=0"
  PKG_DENABLE_WS281XPWM="-DENABLE_WS281XPWM=1"
elif [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET xorg-server xrandr"
  PKG_X11_SUPPORT="-DENABLE_X11=1"
fi

pre_configure_target() {
  echo "" > ../cmake/FindGitVersion.cmake
  CFLAGS="$CFLAGS -lpcre2-16"
}

PKG_CMAKE_OPTS_TARGET="-DCMAKE_NO_SYSTEM_FROM_IMPORTED=ON \
                       -DCMAKE_BUILD_TYPE=Release\
                       -DUSE_SHARED_AVAHI_LIBS=ON\
                       -DUSE_SYSTEM_PROTO_LIBS=1 \
                       $PKG_PLATFORM \
                       $PKG_AMLOGIC_SUPPORT \
                       $PKG_DISPMANX_SUPPORT \
                       $PKG_FB_SUPPORT \
                       $PKG_DENABLE_WS281XPWM \
                       $PKG_X11_SUPPORT \
                       -DENABLE_OSX=0 \
                       -DENABLE_SPIDEV=1 \
                       -DENABLE_TINKERFORGE=0 \
                       -DENABLE_V4L2=1 \
                       -DENABLE_QT5=1 \
                       -DENABLE_TESTS=0 \
                       -Wno-dev"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp $PKG_BUILD/.$TARGET_NAME/bin/* $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -PR $PKG_BUILD/assets/webconfig $ADDON_BUILD/$PKG_ADDON_ID
  cp -PR $PKG_BUILD/effects $ADDON_BUILD/$PKG_ADDON_ID
}
