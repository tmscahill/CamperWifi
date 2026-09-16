include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-camperwifi
PKG_VERSION:=0.2.0
PKG_RELEASE:=1
PKG_MAINTAINER:=CamperWifi contributors
PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI support for CamperWifi captive portal control
LUCI_DEPENDS:=+luci-base +mwan3 +rpcd-mod-file
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
