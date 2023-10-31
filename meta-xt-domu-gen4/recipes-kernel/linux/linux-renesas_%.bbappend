FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

#RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"
RENESAS_BSP_URL = "git://github.com/torvalds/linux.git"
BRANCH = "${XT_KERNEL_BRANCH}"
SRCREV = "${XT_KERNEL_REV}"
LINUX_VERSION = "6.4.0"

SRC_URI = "${RENESAS_BSP_URL};nocheckout=1;branch=${BRANCH};protocol=https \
    file://r8a779f0-spider-domu.dts;subdir=git/arch/${ARCH}/boot/dts/renesas \
    file://defconfig \
    file://rswitch.cfg \
    file://dmatest.cfg \
    file://ixgbevf.cfg \
"
# Ignore in-tree defconfig
KBUILD_DEFCONFIG = ""

KERNEL_DEVICETREE:append = " renesas/r8a779f0-spider-domu.dtb"
KERNEL_DEVICETREE:remove = " renesas/r8a779f0-spider-native.dtb"
