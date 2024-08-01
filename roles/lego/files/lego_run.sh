#!/usr/bin/env bash

LEGO_BINARY=$(/usr/bin/env which lego)

if [[ -n "$LEGO_HTTP_FALLBACK_PORT" ]]; then
  nc -z 127.0.0.1 $LEGO_HTTP_PORT;
  if [[ $? -eq 0 ]]; then
      LEGO_HTTP_PORT=$LEGO_HTTP_FALLBACK_PORT
  fi
fi

LEGO_COMMAND_ARGS_EXPANDED=$(bash -c "echo $LEGO_COMMAND_ARGS") # This is a bit icky

FILES_IN_DIR=$(find "$LEGO_CERT_STORE_PATH/certificates" | wc -l)
if [[ $FILES_IN_DIR -gt 2 ]]; then
        $LEGO_BINARY $LEGO_COMMAND_ARGS_EXPANDED renew --days=$LEGO_CERT_DAYS_TO_RENEW
else
        $LEGO_BINARY $LEGO_COMMAND_ARGS_EXPANDED run
fi