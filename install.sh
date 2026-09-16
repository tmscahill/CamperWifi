#!/bin/sh
set -e
BASE="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
for p in mwan3 rpcd-mod-file; do
  opkg list-installed | grep -q "^${p} " || { echo "Missing package: $p" >&2; exit 1; }
done
install -m 755 "$BASE/scripts/portal-on" /usr/bin/portal-on
install -m 755 "$BASE/scripts/portal-off" /usr/bin/portal-off
install -m 755 "$BASE/scripts/portal-status" /usr/bin/portal-status
mkdir -p /www/luci-static/resources/view/network /usr/share/luci/menu.d /usr/share/rpcd/acl.d
install -m 644 "$BASE/luci/www/luci-static/resources/view/network/campground_portal.js" /www/luci-static/resources/view/network/campground_portal.js
install -m 644 "$BASE/luci/usr/share/luci/menu.d/camperwifi-portal.json" /usr/share/luci/menu.d/camperwifi-portal.json
install -m 644 "$BASE/luci/usr/share/rpcd/acl.d/camperwifi-portal.json" /usr/share/rpcd/acl.d/camperwifi-portal.json
rm -f /tmp/luci-indexcache*
/etc/init.d/rpcd restart
/etc/init.d/uhttpd restart
echo "CamperWifi portal files installed. Verify with: /usr/bin/portal-status"
