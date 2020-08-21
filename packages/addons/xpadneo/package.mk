PKG_NAME="xpadneo"
PKG_VERSION="041e8d8cc9a1ec3184a12fe057b8d7d568e72f23"
PKG_SHA256="9979df3f3db15e24a5fe8aef96a10f8bb7550fbed6da0815191eea84a73495d9"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/atar-axis/xpadneo"
PKG_URL="https://github.com/atar-axis/xpadneo/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Advanced Linux Driver for Xbox One Wireless Gamepad"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="make"

make_target() {
kernel_make -C $(kernel_path) M=$PKG_BUILD/hid-xpadneo/src modules
}

makeinstall_target() {
mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
cp $PKG_BUILD/hid-xpadneo/src/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
