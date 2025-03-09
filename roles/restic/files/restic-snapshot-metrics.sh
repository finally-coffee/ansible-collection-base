#!/usr/bin/env bash

RESTIC_JSON=$(</dev/stdin)

echo $RESTIC_JSON | jq -r '.[]
    | {
        "hostname": .hostname,
        "username": .username,
	"short_id": .short_id,
        "time": ((((.time | split(".")[0]) + "Z") | fromdate) - (3600 * (.time | split("+")[1] | split(":")[0] | tonumber + 1))),
        "paths": .paths[]
    } | "restic_snapshots{hostname=\"\(.hostname)\",username=\"\(.username)\",short_id=\"\(.short_id)\",paths=\"\(.paths)\"} \(.time)"'
