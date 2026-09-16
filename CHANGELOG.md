# Changelog

All notable project changes are documented here.

## [0.2.0] - 2026-09-16

### Added
- Public GitHub repository layout and contributor-facing documentation.
- GitHub Actions validation workflow.
- Tag-driven release workflow that generates a downloadable source ZIP and SHA-256 checksum.
- OpenWrt `luci-app-camperwifi` package source tree for `.ipk` builds.
- Package dependencies on `luci-base`, `mwan3`, and `rpcd-mod-file`.
- Restricted rpcd ACL for the CamperWifi helper executables.
- Configuration backup and interactive restore scripts.
- Architecture diagrams and screenshot placeholders.
- Bug report and feature request issue forms plus pull request template.
- Build helper and package-building documentation.

### Changed
- Package-installed helper scripts use `camperwifi-portal-*` names to avoid collisions with manually installed scripts.
- LuCI package menu is **Network → CamperWifi**.

### Known limitations
- v0.2.0 packages the captive-portal control UI; it does not automatically create the user's WAN, firewall, wireless, DHCP, or mwan3 topology.
- The current portal helper uses the project-specific reserved iPad address `192.168.50.222/32` and mwan3 policy names. A future release should expose these as UCI-configurable settings.
- `.ipk` compilation requires an OpenWrt buildroot/SDK compatible with the target OpenWrt release.
