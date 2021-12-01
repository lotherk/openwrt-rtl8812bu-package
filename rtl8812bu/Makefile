include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl88x2bu
PKG_RELEASE=1

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_SOURCE_URL:=https://github.com/cilynx/rtl88x2bu.git

PKG_MIRROR_HASH:=skip
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-10-11
PKG_SOURCE_VERSION:=e8ad266af883b60e88012957e89bf361924ea5ec

PKG_MAINTAINER:=Jason <nah@nah.nah>
PKG_BUILD_PARALLEL:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl88x2bu
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for Realtek 88x2bu
  DEPENDS:=+kmod-cfg80211 +kmod-usb-core +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT
  FILES:=\
	$(PKG_BUILD_DIR)/88x2bu.ko
  AUTOLOAD:=$(call AutoProbe,88x2bu)
  PROVIDES:=kmod-88x2bu
endef

RTL8812BU_MAKEOPTS= -C $(PKG_BUILD_DIR) \
		PATH="$(TARGET_PATH)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		TARGET="$(HAL_TARGET)" \
		TOOLPREFIX="$(KERNEL_CROSS)" \
		TOOLPATH="$(KERNEL_CROSS)" \
		KERNELPATH="$(LINUX_DIR)" \
		KERNELDIR="$(LINUX_DIR)" \
		LDOPTS=" " \
		DOMULTI=1

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rp * $(PKG_BUILD_DIR)
	cd $(PKG_BUILD_DIR)
	sed -i 's/I386_PC = y/I386_PC = n/' Makefile
	sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
endef

define Build/Compile
	$(MAKE) $(RTL8812BU_MAKEOPTS) modules
endef
$(eval $(call KernelPackage,rtl88x2bu))
