#!/usr/bin/env bash
set -euo pipefail
BUILDROOT="${1:-}"
if [[ -z "$BUILDROOT" || ! -f "$BUILDROOT/rules.mk" ]]; then
  echo "Usage: $0 /path/to/openwrt-buildroot" >&2
  exit 2
fi
SRC="$(cd "$(dirname "$0")/.." && pwd)/openwrt/luci-app-camperwifi"
DEST="$BUILDROOT/package/camperwifi/luci-app-camperwifi"
rm -rf "$DEST"
mkdir -p "$(dirname "$DEST")"
cp -a "$SRC" "$DEST"
cd "$BUILDROOT"
make defconfig
make package/luci-app-camperwifi/compile V=s
find bin -type f -name 'luci-app-camperwifi*.ipk' -print
