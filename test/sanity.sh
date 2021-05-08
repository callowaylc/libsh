#!/usr/bin/env false
# A sanity check of testing system
set -eu
. sh/debug.sh

## env
status=$(echo $(($RANDOM%2)))

## main
debug "test/sanity" -- "status=$status"

echo "A Sanity Check"
exit $status
