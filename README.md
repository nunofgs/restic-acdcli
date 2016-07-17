# Automated encrypted backups using restic to Amazon Cloud Drive

This is a Docker container that uses [restic](https://restic.github.io/) to create an encrypted incremental backup and copy it to your Amazon Cloud Drive.

## Quick start

Obtain an OAuth token for your ACD account [here](https://tensile-runway-92512.appspot.com).

```shell
$ docker run \
  --device=/dev/fuse \
  -e ACD_TOKEN=<my-oauth-token> \
  -e RESTIC_PASSWORD=<my-password> \
  -v <my-backups-folder>:/data \
  nunofgs/restic-acdcli
```

## Supported environment variables

Variable          | Description                                  | Default value
----------------- | -------------------------------------------- | ------------------
ACD_TOKEN         | The OAuth token for your ACD account         | _n/a_
RESTIC_PASSWORD   | The password to encrypt your backups         | _n/a_
RESTIC_REPOSITORY | The directory where backups will be saved to | _/mounted/Backups_
