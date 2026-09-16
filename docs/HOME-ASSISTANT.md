# Home Assistant Architecture

For the production CamperWifi design, keep the Raspberry Pi 3B+ dedicated to OpenWrt. Running a full Home Assistant stack beside the router is technically possible in some arrangements but is not recommended on a 1 GB Pi that is already responsible for routing, DHCP/DNS, Wi-Fi, firewalling, mwan3 and captive-portal control.

Recommended topology:

```text
OpenWrt Pi 3B+
  routing / DHCP / DNS / mwan3 / portal
             |
       192.168.50.0/24
             |
Separate Home Assistant host
  Pi 4/5 + SSD or x86 mini-PC
```

Potential dashboard data includes WAN state, campground association, portal status, tank levels, LPG, leveling, power and solar data where the corresponding device exposes a usable integration/API.
