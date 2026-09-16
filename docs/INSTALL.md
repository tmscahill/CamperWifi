# Installation

## 1. Prerequisites

This project documents the known CamperWifi build on Raspberry Pi 3B+ running OpenWrt 24.10.4.

Install the required packages:

```sh
opkg update
opkg install mwan3 luci-app-mwan3 rpcd-mod-file
```

Verify rpcd file execution support:

```sh
/etc/init.d/rpcd restart
ubus -v list file
```

The output must include `exec`.

## 2. Back up OpenWrt

```sh
sysupgrade -b /tmp/camperwifi-before-install.tar.gz
```

## 3. Install project files

From the unpacked repository root:

```sh
chmod +x install.sh
./install.sh
```

## 4. Verify scripts

```sh
ls -l /usr/bin/portal-on /usr/bin/portal-off /usr/bin/portal-status
/usr/bin/portal-status
ubus call file exec '{"command":"/usr/bin/portal-status"}'
```

## 5. Verify LuCI

Hard-refresh LuCI and navigate to **Network → Campground Portal**.

## 6. Validate routing

```sh
mwan3 status
ip route
ip rule show
```

Do not modify the known-good `desk` management path at `192.168.4.54` without local console access.
