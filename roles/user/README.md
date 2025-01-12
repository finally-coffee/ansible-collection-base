# `finallycoffee.base.user` ansible role

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
