#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jd-jingqi
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=null<h980501427@163.com>
PKG_LICENSE:=GPL

include $(INCLUDE_DIR)/package.mk

define Package/jd-jingqi
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Show JD-JingQi-ConfSec2019-Bejing
  DEPENDS:=libc
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/jd-jingqi/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) ./files/shepherd-active.sh $(1)/etc/
	$(CP) ./files/www $(1)/
	chmod 0755 $(1)/etc/shepherd-active.sh
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/jd-jingqi $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,jd-jingqi))
