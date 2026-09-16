#!/bin/sh
set -eu
OUT="${1:-/tmp/camperwifi-backup-$(date +%Y%m%d-%H%M%S).tar.gz}"
TMP="$(mktemp -d /tmp/camperwifi-backup.XXXXXX)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/etc/config" "$TMP/usr/bin" "$TMP/usr/share/luci/menu.d" "$TMP/usr/share/rpcd/acl.d" "$TMP/www/luci-static/resources/view/network"
for f in network firewall wireless dhcp mwan3; do [ -f "/etc/config/$f" ] && cp -p "/etc/config/$f" "$TMP/etc/config/"; done
for f in /usr/bin/portal-on /usr/bin/portal-off /usr/bin/portal-status /usr/bin/camperwifi-portal-on /usr/bin/camperwifi-portal-off /usr/bin/camperwifi-portal-status; do [ -f "$f" ] && cp -p "$f" "$TMP/usr/bin/"; done
for f in /usr/share/luci/menu.d/*camperwifi*.json; do [ -f "$f" ] && cp -p "$f" "$TMP/usr/share/luci/menu.d/"; done
for f in /usr/share/rpcd/acl.d/*camperwifi*.json; do [ -f "$f" ] && cp -p "$f" "$TMP/usr/share/rpcd/acl.d/"; done
for f in /www/luci-static/resources/view/network/*camperwifi*.js /www/luci-static/resources/view/network/campground_portal.js; do [ -f "$f" ] && cp -p "$f" "$TMP/www/luci-static/resources/view/network/"; done
( cd "$TMP" && tar -czf "$OUT" . )
echo "Backup written to $OUT"
