# `finallycoffee.base.dns` ansible role

Simple role for wrapping around the
[`famedly.dns.update`](https://github.com/famedly/ansible-collection-dns/blob/main/plugins/modules/update.py)
ansible module.

## Usage

### Example playbook
```yaml
- target: "{{ target_hosts }}"
  roles:
    - role: finallycoffee.base.dns
      vars:
        dns_server: "dns.example.org"
        dns_zone: "zone.example.org"
        dns_records: "{{ dns_records }}"
        dns_record_state: exact
        dns_tsig_name: "mykeyname"
        dns_tsig_algo: "hmac-sha256"
        dns_tsig_key: "mykeycontent"
  vars:
    dns_records:
      - type: A
        name: gitea
        content: "127.0.0.1"
      - type: AAAA
        name: gitea
        content: "fe80::1"
      - type: CNAME
        name: "_acme_challenge.gitea"
        content: "delegated-cname.challenge.example.org"
```
