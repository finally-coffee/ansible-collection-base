---

# `finallycoffee.base.redis` ansible role

Ansible role to deploy redis. Can use systemd or docker, depending on the
value of `redis_deployment_method`. Supports running the role multiple times
by setting `redis_instance` to a unique string to avoid namespace-collisions.

## Configuration

Extra configurations keys for redis can be provided as key-value pairs
in `redis_config`. For all configuration keys, consult the upstream example
redis.conf.
