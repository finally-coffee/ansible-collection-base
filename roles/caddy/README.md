# `finallycoffee.base.caddy` ansible role

Deploy a (pre-)configure [caddy v2](https://caddyserver.com) web
server / proxy using ansible.

## Configuration

To change the default configuration of reading all files from
`/etc/caddy/sites.d/` (see `caddy_dynamic_config_dir`), specify
your desired configuration in `caddy_config`.
