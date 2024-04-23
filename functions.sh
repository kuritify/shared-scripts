#!/usr/bin/env bash

if [ -n "${DEBUG+''}" ]; then
  set -x
fi

set -eu -o pipefail

DOCKER_PLATFORM_FLAG=""
if [[ $(uname -m) == 'arm64' ]]; then
  DOCKER_PLATFORM_FLAG="--platform linux/amd64 "
fi

TTY=false
if [ -t 0 ]; then
  TTY=true
fi
