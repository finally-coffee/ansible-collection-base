# `finallycoffee.base` ansible collection

## Overview

This ansible collection provides various roles for installing
and configuring basic system utilities like gnupg, ssh etc

- [`caddy`](roles/caddy/README.md): configures and runs caddy

- [`git`](roles/git/README.md): configures git on the target system

- [`gnupg`](roles/gnupg/README.md): configures gnupg on the target system

- [`lego`](roles/lego/README.md): runs [lego (LetsEncrypt Go)](https://github.com/go-acme/lego),
  a ACME client written in go, using systemd (timers). Multi-instance capable.

- [`minio`](roles/minio/README.md): Deploy [min.io](https://min.io), an
  s3-compatible object storage server, using docker containers.

- [`nginx`](roles/nginx/README.md): [nginx](https://www.nginx.com/),
  an advanced load balancer, webserver and reverse proxy.

- [`restic`](roles/restic/README.md): Manage backups using restic
  and persist them to a configurable backend.

- [`powerdns_tsig_key`](roles/powerdns_tsig_key/README.md): Simple ansible role
  for generating TSIG keys in PowerDNS.

## License

[CNPLv7+](LICENSE.md): Cooperative Nonviolent Public License
