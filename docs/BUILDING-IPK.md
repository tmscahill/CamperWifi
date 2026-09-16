# Building `luci-app-camperwifi`

CamperWifi v0.2.0 includes an OpenWrt LuCI package source tree at `openwrt/luci-app-camperwifi/`.

## OpenWrt buildroot method

1. Clone the OpenWrt source tree matching the release you want to target.
2. Update/install feeds, including LuCI.
3. Copy `openwrt/luci-app-camperwifi` into `package/camperwifi/luci-app-camperwifi` in the buildroot, or run `tools/build-ipk.sh`.
4. Configure the target architecture.
5. Select `luci-app-camperwifi` as a module (`<M>`).
6. Build it with:

```sh
make package/luci-app-camperwifi/compile V=s
```

On opkg-based OpenWrt builds, locate the result with:

```sh
find bin -name 'luci-app-camperwifi*.ipk' -print
```

## Install on the router

Copy the package to `/tmp`, then:

```sh
opkg update
opkg install /tmp/luci-app-camperwifi_*.ipk
/etc/init.d/rpcd restart
/etc/init.d/uhttpd restart
```

Log out of LuCI and back in. The page should appear under **Network → CamperWifi**.

## Important

The package intentionally does not overwrite `/etc/config/network`, `/etc/config/firewall`, `/etc/config/wireless`, `/etc/config/dhcp`, or `/etc/config/mwan3`. Those files are router-specific and overwriting them could remove management access.
