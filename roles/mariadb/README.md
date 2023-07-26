# `finallycoffee.base.mariadb` ansible role

This role deploys a MariaDB instance in a docker container.

## Usage

The role expects the following variables to be populated with values and/or secrets:

```yaml
mariadb_root_password: #mariadb root password
mariadb_database: # name of the database to create
mariadb_username: # name of a user to auto-create and assign permission on the mariadb_database
mariadb_password: # password of the user in mariadb_username
```

## Requirements

- Docker installed
- python-docker present on target system for ansible to be able to talk with the docker API.
