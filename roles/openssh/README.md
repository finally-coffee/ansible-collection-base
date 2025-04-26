# `finallycoffee.base.openssh`

Ansible role to manage and configure openssh and it's components (like `sshd`).

Currently supports `fedora` and `debian` linux distributions.

## `sshd`

To configure `sshd`, see the [`defaults/main/sshd.yml`](defaults/main/sshd.yml),
where snake\_cased config keys for `/etc/ssh/sshd_config` are available in
the `openssh_sshd_config_` namespace.

To add your own config on top, simply use key-value syntax in `openssh_sshd_config`.
