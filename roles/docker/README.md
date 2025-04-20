# `finallycoffee.base.docker` ansible role

Install and configure the docker daemon.

## Configuration

- `docker_daemon_config` - configuration for the docker daemon
- `docker_remove_legacy_packages` - clean up old versions of docker (see https://docs.docker.com/engine/install/debian/#uninstall-old-versions)

## Plugins

- `docker_plugin_buildx_enable` - enable the buildx plugin
- `docker_plugin_compose_enable` - enable docker compose
