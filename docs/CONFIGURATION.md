# Configuration Reference

| Function | Interface/device | Address / priority |
|---|---|---|
| Camper LAN | `br-lan` | `192.168.50.1/24` |
| Camper AP | built-in Wi-Fi | SSID `charlottesweb` |
| Ethernet primary | `desk` / `eth0` | `192.168.4.54/24`, gateway `192.168.4.1`, route metric 5 |
| Campground Wi-Fi | `campground` / RT5370 | DHCP, recommended route metric 10 |
| iPhone USB | `IPhone_WAN` / `eth1` | DHCP, route metric 15 |
| Portal iPad | LAN client | `192.168.50.222`, MAC `12:70:AC:63:1E:36` |

## mwan3 priority

- `desk_primary`: metric 1, weight 1
- `campground_secondary`: metric 2, weight 1
- `iphone_backup`: metric 3, weight 1

`camper_failover` uses those members in that order.

`campground_only` contains only `campground_secondary`.

The portal source rule uses `192.168.50.222/32`. The dnsmasq DHCP reservation uses plain `192.168.50.222` without `/32`.
