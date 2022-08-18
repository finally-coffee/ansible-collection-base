#!/bin/bash

rc=$(pgrep gpg-agent)
if [ "$rc" != 0 ]; then
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
else
  eval $(gpg-agent --daemon)
fi

gpg-connect-agent /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
