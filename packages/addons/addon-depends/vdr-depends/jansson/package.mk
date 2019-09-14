# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jansson"
PKG_VERSION="2.12"
PKG_SHA256="76260d30e9bbd0ef392798525e8cd7fe59a6450c54ca6135672e3cd6a1642941"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/akheron/jansson"
PKG_URL="https://github.com/akheron/jansson/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A C library for encoding, decoding and manipulating JSON data."

PKG_CMAKE_OPTS_TARGET="-DJANSSON_BUILD_SHARED_LIBS=ON \
                       -DJANSSON_BUILD_DOCS=OFF \
                       -DJANSSON_WITHOUT_TESTS=ON \
                       -DJANSSON_EXAMPLES=OFF"
