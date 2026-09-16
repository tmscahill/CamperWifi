#!/bin/sh
set -eu
ARCHIVE="${1:-}"
[ -n "$ARCHIVE" ] && [ -f "$ARCHIVE" ] || { echo "Usage: $0 <camperwifi-backup.tar.gz>" >&2; exit 2; }
echo "WARNING: this restores network/firewall/wireless/DHCP/mwan3 files and may interrupt SSH."
printf "Type RESTORE to continue: "
read answer
[ "$answer" = RESTORE ] || { echo "Cancelled."; exit 1; }
TMP="$(mktemp -d /tmp/camperwifi-restore.XXXXXX)"
trap 'rm -rf "$TMP"' EXIT
tar -xzf "$ARCHIVE" -C "$TMP"
for d in etc/config usr/bin usr/share/luci/menu.d usr/share/rpcd/acl.d www/luci-static/resources/view/network; do
  [ -d "$TMP/$d" ] || continue
  mkdir -p "/$d"
  cp -p "$TMP/$d/"* "/$d/" 2>/dev/null || true
done
chmod 755 /usr/bin/*portal-on /usr/bin/*portal-off /usr/bin/*portal-status 2>/dev/null || true
uci -q commit || true
rm -f /tmp/luci-indexcache*
/etc/init.d/dnsmasq restart || true
/etc/init.d/rpcd restart || true
/etc/init.d/uhttpd restart || true
/etc/init.d/mwan3 restart || true
echo "Restore complete. Verify management access, DNS, firewall, and mwan3 immediately."
