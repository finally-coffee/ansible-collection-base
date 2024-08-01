# `finallycoffee.base.lego` ansible role

This role can be used to retrieve ACME certificates on the target host. It uses `lego` for that, and with systemd template units provides an easy way to configure and monitor the status for each certificate.

## Requirements

- `systemd`
- write access to /tmp to unpack the lego release tarball during installation
- write access to /opt/lego (or whatever `lego_base_path` is set to) for configuration and certificate data
- `become` privileges of the `ansible_user` on the target

## Usage

### Required configuration

- `lego_instance` - used for allowing multiple lego jobs to run with systemd template units. recommended to be set to the CN / first SAN of the certificate.
- `lego_cert_domains` - list of FQDNs to request a certificate for
- `lego_acme_account_email` - when using letsencrypt, a contact email is mandatory

### Proxies / Registries

The role ensure `lego` is downloaded from the github release page. If you are behind a proxy or use a registry like Nexus3, set `lego_release_archive_server`.

### ACME server

Per default, the Letsencrypt Staging ACME server is configured. Set `lego_acme_server_url` from `lego_letsencrypt_server_urls.{qa,prod}` or configure your own ACME v2 server directly.

### Certificate

To set for which domains to request a certificate for, set them as a list of SANs in `lego_cert_domains`. The default key type is EC256 and can be overridden using `lego_cert_key_type`.

Set the type of challenge in `lego_acme_challenge_type` (to either `http` or `dns`), and `lego_acme_challenge_provider` to, for example, `rfc2136` for DNS challenges using the DNSUPDATE mechanism. If your challenge needs additional data, set that in `lego_command_config` as a dictionary analog to `lego_base_command_config` (see [defaults](defaults/main.yml)).

## Trivia

### Architecture

By default, the lego distribution for `linux` on `amd64` is downloaded. If your target needs a different architecture or target OS, adjust this in `lego_os` and `lego_architecture`, cross-checking with the [lego GitHub release page](https://github.com/go-acme/lego/releases/tag/v4.17.4) for upstream availability.

### User management

The role will attempt to create user+group for each seperate lego instance for data isolation (i.e. to avoid leaking a TSIG key from one lego instance to other services). The user and group are of the form `acme-{{ lego_instance }}`. Beware that changing this in `lego_cert_{user,group}` also requires `lego_systemd_{user,group}` to be adjusted!
