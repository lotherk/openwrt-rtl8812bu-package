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

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		modules
endef

$(eval $(call KernelPackage,rtl88x2bu))
