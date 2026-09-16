# Troubleshooting

## IP works but DNS fails

```sh
ping -c 3 1.1.1.1
/etc/init.d/dnsmasq status
netstat -lnp 2>/dev/null | grep ':53'
logread | grep -i dnsmasq | tail -40
```

A failure encountered during this project was a duplicate DHCP reservation for `192.168.50.222`, which caused dnsmasq to crash.

Check:

```sh
uci show dhcp | grep -B4 -A4 '192.168.50.222'
```

There must be exactly one reservation for the portal iPad.

## `ubus call file exec` says Not found

First verify the script exists:

```sh
ls -l /usr/bin/portal-status
```

Then verify `rpcd-mod-file` and `file.exec`:

```sh
opkg list-installed | grep rpcd-mod-file
ubus -v list file
```

## LuCI page does not update

```sh
rm -f /tmp/luci-indexcache*
/etc/init.d/rpcd restart
/etc/init.d/uhttpd restart
```

Then hard-refresh the browser.

## Quick diagnostic bundle

Run `scripts/diagnostics.sh` from this repository.
