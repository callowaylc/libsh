#!/bin/sh
## Produces TAP output from a given set of executable files
#$ test.sh ./test ./another/path *.test
set -eu
. sh/teardown.sh
. sh/debug.sh
. sh/enc.sh

## env
tests=$@
count=$( printf "%s\n" "$@" | wc -l )

## main
echo "$@" | debug "Test" -- "count=$count" "%s"

printf "1..%s\n" $count


