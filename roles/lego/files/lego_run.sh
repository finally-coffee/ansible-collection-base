#!/usr/bin/env bash

LEGO_BINARY=$(/usr/bin/env which lego)

FILES_IN_DIR=$(find "$LEGO_CERT_STORE_PATH/certificates" | wc -l)
if [[ $FILES_IN_DIR -gt 2 ]]; then
	$LEGO_BINARY $LEGO_COMMAND_ARGS renew --days=$LEGO_CERT_DAYS_TO_RENEW
else
	$LEGO_BINARY $LEGO_COMMAND_ARGS run
fi
