# `debian-proxmox` ansible role

This ansible role can be used to convert a (running and reachable) debian to a proxmox instance.

It automates the instructions from https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_11_Bullseye.

## Usage

This role will attempt to ensure that the `/etc/hosts` are configured correctly for PVE.
The public IP of the server should be given in `debian_proxmox_public_ip` and defaults to
`ansible_facts['eno1'].ipv4.address`.

The hostname and fqdn should be correctly set in `debian_proxmox_hostname` and `debian_proxmox_fqdn`,
and default to `ansible_hostname` and `ansible_fqdn` respectively.

## Packages

It is recommended to remove the packages for the `os-prober` (which would attempt to add VMs as bootable entries
in the bootloader) and the default linux kernel `linux-image-amd64` / `linux-image-5.10*` (and use the proxmox-provided
kernel instead). This role will remove those packages without asking, so be aware.