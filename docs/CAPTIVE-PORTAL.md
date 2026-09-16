# Captive Portal

The iPad remains connected to `charlottesweb`. Portal mode creates an mwan3 source rule forcing only `192.168.50.222/32` through `campground_only`.

## CLI

```sh
/usr/bin/portal-on
/usr/bin/portal-status
/usr/bin/portal-off
```

## LuCI

Use **Network → Campground Portal**.

After enabling portal mode, open `http://neverssl.com/` on the iPad to provoke campground captive-portal interception.

After authentication, disable portal mode so the iPad returns to `camper_failover` with all other LAN clients.
