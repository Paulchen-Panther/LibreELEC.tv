# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="swig"
PKG_VERSION="4.0.1"
PKG_SHA256="7a00b4d0d53ad97a14316135e2d702091cd5f193bb58bcfcd8bc59d41e7887a9"
PKG_LICENSE="GPL"
PKG_SITE="http://www.swig.org"
PKG_URL="https://downloads.sourceforge.net/swig/swig-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages."

PKG_CONFIGURE_OPTS_HOST="--program-suffix=4.0 \
                         --with-pcre-prefix=$TOOLCHAIN \
                         --with-boost=no \
                         --without-pcre \
                         --without-x \
                         --without-tcl \
                         --without-python \
                         --without-python3 \
                         --without-perl5 \
                         --without-octave \
                         --without-java \
                         --without-gcj \
                         --without-android \
                         --without-guile \
                         --without-mzscheme \
                         --without-ruby \
                         --without-php \
                         --without-ocaml \
                         --without-pike \
                         --without-chicken \
                         --without-csharp \
                         --without-lua \
                         --without-allegrocl \
                         --without-clisp \
                         --without-r \
                         --without-go \
                         --without-d"

post_makeinstall_host() {
  ln -sf swig4.0 $TOOLCHAIN/bin/swig
}
