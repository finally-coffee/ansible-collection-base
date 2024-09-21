# `finallycoffee.base.powerdns_tsig_key`

Simple ansible role for ensuring a TSIG key is present in a given PowerDNS-
instance.

## Usage

The usage example below assumes `powerdns` is running in a container named `powerdns` (as supplied to `powerdns_tsig_key_container_name`.

```yaml
- hosts: "{{ target_hosts }}"
  become: true
  roles:
    - role: finallycoffee.base.powerdns_tsig_key
      vars:
        powerdns_tsig_key_name: "nameofmykey"
        powerdns_tsig_key_path: "/var/lib/myapp/tsig.key"
        powernds_tsig_key_algo: "hmac-sha512"
        powerdns_tsig_key_path_owner: "myappuser"
        powerdns_tsig_key_path_group: "myappgroup"
        powerdns_tsig_key_container_name: 'powerdns'
```

> [!INFO]
> Support for non-docker deployments is pending.
