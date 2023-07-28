# `finallycoffee.base.minio` ansible role

## Overview

This role deploys a [min.io](https://min.io) server (s3-compatible object storage server)
using the official docker container image.

## Configuration

The role requires setting the password for the `root` user (name can be changed by
setting `minio_root_username`) in `minio_root_password`. That user has full control
over the minio-server instance.

### Useful config hints

Most configuration is done by setting environment variables in
`minio_container_extra_env`, for example:

```yaml
minio_container_extra_env:
  # disable the "console" web browser UI
  MINIO_BROWSER: off
  # enable public prometheus metrics on `/minio/v2/metrics/cluster`
  MINIO_PROMETHEUS_AUTH_TYPE: public
```

When serving minio (or any s3-compatible server) on a "subfolder",
see https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTRedirect.html
and https://docs.aws.amazon.com/AmazonS3/latest/userguide/VirtualHosting.html
