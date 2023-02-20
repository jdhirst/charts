# firefly-mariadbdb

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Installs a mariadb db for Firefly III

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jdhirst | <jdhirst@hirstgroup.net> |  |
## Source Code

* <https://github.com/jdhirst/charts/tree/master/src/firefly-mariadb>

## Upgrading

When a release introduces breaking changes, this section outlines the manual actions that need to be taken.

### From 0.0.2 to 0.0.3

The storage class and access modes have been changed to match more setups without the need for configuration. If you want to keep the old settings, set the following values:

```yaml
storage:
  class: nfs-client
  accessModes: ReadWriteMany
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backupSchedule | string | `"0 3 * * *"` |  |
| configs.BACKUP_URL | string | `""` |  |
| configs.MYSQL_RANDOM_ROOT_PASSWORD | bool | true |  |
| configs.MYSQL_USER | string | firefly |  |
| configs.MYSQL_PASSWORD | string | firefly |  |
| configs.MYSQL_DATABASE | string | firefly |  |
| configs.RESTORE_URL | string | `""` |  |
| configs.TZ | string | `"Europe/Amsterdan"` |  |
| configs.existingSecret | string | `""` | Set this to the name of a secret to load environment variables from. If defined, values in the secret will override values in configs |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"postgres"` |  |
| image.tag | string | `"10-alpine"` |  |
| storage.accessModes | string | `"ReadWriteOnce"` |  |
| storage.class | string | `nil` |  |
| storage.dataSize | string | `"1Gi"` |  |
| storage.existingClaim | string | `""` | Use an existing PersistentVolumeClaim, overrides values above |
