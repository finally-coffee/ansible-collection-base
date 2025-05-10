#!/usr/bin/env bash
set -xeuo pipefail

LEGO_BINARY=$(/usr/bin/env which lego)

if [[ -n "${LEGO_HTTP_FALLBACK_PORT:-}" ]]; then
  if ! nc_binary="$(type -p 'nc')" || [[ -z $nc_binary ]]; then
    echo "nc not found (in PATH), exiting"
    exit 1
  fi
  set +e
  nc -z 127.0.0.1 $LEGO_HTTP_PORT;
  nc_exit_code=$?;
  set -e
  if [[ $nc_exit_code -eq 0 ]]; then
      LEGO_HTTP_PORT=$LEGO_HTTP_FALLBACK_PORT
  fi
fi

if [[ -n "${LEGO_PRE_RENEWAL_HOOK:-}" ]]; then
  $LEGO_PRE_RENEWAL_HOOK
fi

LEGO_COMMAND_ARGS_EXPANDED=$(bash -c "echo $LEGO_COMMAND_ARGS") # This is a bit icky

FILES_IN_DIR=$(find "$LEGO_CERT_STORE_PATH/certificates" -type f | wc -l)
if [[ $FILES_IN_DIR -gt 2 ]]; then
        $LEGO_BINARY $LEGO_COMMAND_ARGS_EXPANDED renew --days=$LEGO_CERT_DAYS_TO_RENEW
else
        $LEGO_BINARY $LEGO_COMMAND_ARGS_EXPANDED run
fi

find "$LEGO_CERT_STORE_PATH/certificates" -type f | xargs -I{} -n 1 chmod "$LEGO_CERT_MODE" "{}"
find "$LEGO_CERT_STORE_PATH/certificates" -type f | xargs -I{} -n 1 chown "${LEGO_CERT_USER}:${LEGO_CERT_GROUP}" "{}"

if [[ -n "${LEGO_POST_RENEWAL_HOOK:-}" ]]; then
  $LEGO_POST_RENEWAL_HOOK
fi
