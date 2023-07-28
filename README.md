# `finallycoffee.base` ansible collection

## Overview

This ansible collection provides various roles for installing
and configuring basic system utilities like gnupg, ssh etc

- [`elasticsearch`](roles/elasticsearch/README.md): Deploy [elasticsearch](https://www.docker.elastic.co/r/elasticsearch/elasticsearch-oss),
  a popular (distributed) search and analytics engine, mostly known by it's
  letter "E" in the ELK-stack.

- [`git`](roles/git/README.md): configures git on the target system

- [`gnupg`](roles/gnupg/README.md): configures gnupg on the target system

- [`mariadb`](roles/mariadb/README.md): runs [MariaDB Server](https://mariadb.org/), one of the world's most popular open source relational database

- [`minio`](roles/minio/README.md): Deploy [min.io](https://min.io), an
  s3-compatible object storage server, using docker containers.

- [`nginx`](roles/nginx/README.md): [nginx](https://www.nginx.com/),
  an advanced load balancer, webserver and reverse proxy.

## License

[CNPLv7+](LICENSE.md): Cooperative Nonviolent Public License
