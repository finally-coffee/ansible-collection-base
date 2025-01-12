# `finallycoffee.base.user` ansible role

Provision and manage user accounts on the remote host. Supports setting user
home, gecos (display name) and shell.

Warning: if the users' home exists and is changed, the role will attempt to
move the home directory. Set `move_home` to false on the user to disable this
behaviour.

## Examples
```yaml
- hosts: all
  roles:
    - role: finallycoffee.base.user
  vars:
    users:
      - name: root
      - name: alice
      - name: bob
        state: present
      - name: eve
        state: absent
```
