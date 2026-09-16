# Security Notes

- Do not expose arbitrary `/bin/sh` execution through LuCI or rpcd.
- The packaged ACL grants `file.exec` only to the three CamperWifi helper executables.
- Keep LuCI authentication enabled and do not expose the OpenWrt management interface directly to untrusted WAN networks.
- Review backup archives before sharing them. Network configuration may contain SSIDs, keys, MAC addresses, addresses, or other environment-specific information.
- Report security-sensitive issues privately to the repository owner rather than posting secrets in a public issue.
