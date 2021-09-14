#!/bin/sh
## A minimal http server using socat
set -eu

## inc
. "$( dirname $0 )/logger.sh"

## env
port=${1:-8080}

## main
logger -sp DEBUG "Enter" -- "port=$port"

socat -v -d -d \
  TCP-LISTEN:$port,crlf,reuseaddr,fork \
  SYSTEM:"
    echo HTTP/1.1 302 OK;
    echo Location\: \"https://msn.com\";
    echo;
  "
