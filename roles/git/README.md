# `finallycoffee.base.git` ansible role

This role configures git for the `ansible_user` and can be used
to (pre)-configure git.

## Examples

```yaml

git_config_user_name: # user name to use for git
git_config_user_email: # email to use for git

git_config_core_editor: vim # editor to use

git_config_credentials:
  - remote_url: https://github.com
    config:
      username: my_github_username
```
