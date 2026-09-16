#!/bin/sh
echo '=== BOARD ==='; ubus call system board
echo '=== ADDRESSES ==='; ip addr
echo '=== ROUTES ==='; ip route; ip rule show
echo '=== WIRELESS ==='; iw dev
echo '=== MWAN3 ==='; mwan3 status
echo '=== DNSMASQ ==='; /etc/init.d/dnsmasq status; logread | grep -i dnsmasq | tail -40
echo '=== PORTAL ==='; /usr/bin/portal-status 2>&1; ubus call file exec '{"command":"/usr/bin/portal-status"}' 2>&1
