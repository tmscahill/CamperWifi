# Backup and Restore

## Backup

Run on OpenWrt:

```sh
./scripts/backup-config.sh
```

Or provide a destination:

```sh
./scripts/backup-config.sh /tmp/camperwifi-before-change.tar.gz
```

The archive captures the relevant UCI configuration and CamperWifi helper/LuCI files when present.

## Restore

Use a local console if possible. Restoring network and firewall files can interrupt SSH.

```sh
./scripts/restore-config.sh /tmp/camperwifi-backup-YYYYMMDD-HHMMSS.tar.gz
```

The script requires typing `RESTORE` before copying files and restarting services.
