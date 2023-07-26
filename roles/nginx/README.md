# `finallycoffee.services.nginx` ansible role

## Description

Runs `nginx`, a HTTP reverse proxy, in a docker container.

## Usage

For the role to do anything, `nginx_config` needs to be populated with the configuration for nginx.
An example would be:

```yaml
nginx_config: |+
  server {
    listen 80 default_server;
    server_name my.server.fqdn;
    location / { return 200; }
  }
```

The container is named `nginx` by default, this can be overridden in `nginx_container_name`.
When running this role multiple times, `nginx_base_path` should also be changed for each run,
otherwise the configuration files collide in the filesystem.

For exposing this server to the host and/or internet, the `nginx_container_ports` (port forwarding host
from host to container), `nginx_container_networks` (docker networking) or `nginx_container_labels`
(for label-based routing discovery like traefik) can be used. The options correspond to the arguments
of the `community.docker.docker_container` module.
