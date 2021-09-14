#!/bin/sh
## Run argv on posix-strict shell
#$ [ENV=path/to/env/file] sh/posix.sh echo any statement
#< string
set -eu
2>&- >&3 || exec 3>/dev/null

## env
: ${ENV:=/dev/null}
: ${TAG:=latest}

argv=$@

## main
echo $@ | base64 | xargs logger -sp DEBUG "Posix" -- 2>&3
docker run \
	-it \
	--rm \
	--env-file "$ENV" \
	-- alpine:$TAG sh -xc \
	'cat /etc/os-release; $@' _ "$@"
