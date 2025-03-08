#!/usr/bin/env bash

set -euo pipefail

if [[ -n ${RESTIC_PRE_BACKUP_HOOK-} ]]; then
    /bin/bash -c "$RESTIC_PRE_BACKUP_HOOK"
fi

echo "List existing snapshots or initialize repository"
restic snapshots || restic init
sleep 2;

echo "Attempting to remove lock if present"
restic unlock
sleep 2

echo "Start backup on ${@:1}"
restic --verbose --retry-lock=${RESTIC_RETRY_LOCK:-5m} backup "${@:1}"
sleep 2

echo "Forget and prune old snapshots"
restic forget --prune --retry-lock=${RESTIC_RETRY_LOCK:-5m} \
    --keep-within=${RESTIC_FORGET_KEEP_WITHIN:-1d} \
    --keep-hourly=${RESTIC_FORGET_KEEP_HOURLY:-6} \
    --keep-daily=${RESTIC_FORGET_KEEP_DAILY:-2} \
    --keep-weekly=${RESTIC_FORGET_KEEP_WEEKLY:-7} \
    --keep-monthly=${RESTIC_FORGET_KEEP_MONTHLY:-4} \
    --verbose
sleep 2

echo "Generate snapshot metrics"
restic --json snapshots | /opt/restic-generate-snapshot-metrics.sh \
    > /var/lib/node_exporter/restic-snapshots-${RESTIC_JOBNAME:-unknown}.prom-src
sleep 2

echo "Check repository"
restic check
