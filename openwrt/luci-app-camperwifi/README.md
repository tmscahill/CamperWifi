# luci-app-camperwifi

Installable LuCI package for the CamperWifi captive-portal control surface.

It installs:

- `/usr/bin/camperwifi-portal-on`
- `/usr/bin/camperwifi-portal-off`
- `/usr/bin/camperwifi-portal-status`
- LuCI JavaScript view under **Network → CamperWifi**
- LuCI menu metadata
- rpcd ACL entries restricted to the three helper executables

## Build inside OpenWrt buildroot

Copy or link this directory into an OpenWrt package feed, update/install feeds, select `luci-app-camperwifi` as a module, then run:

```sh
make package/luci-app-camperwifi/compile V=s
```

The resulting `.ipk` is normally written below `bin/packages/<arch>/luci/` on opkg-based OpenWrt releases.
