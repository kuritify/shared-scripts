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

function docker-run () {
  if [ "${TTY}" ]; then
    # shellcheck disable=SC2086
    docker run --init --rm -it -e HOST_USER_ID="$(id -u)" -e HOST_GROUP_ID="$(id -g)" $DOCKER_PLATFORM_FLAG "$@"
  else
    # shellcheck disable=SC2086
    docker run --init --rm -e HOST_USER_ID="$(id -u)" -e HOST_GROUP_ID="$(id -g)" $DOCKER_PLATFORM_FLAG "$@"
  fi
}

function docker-build () {
  # shellcheck disable=SC2086
  docker build $DOCKER_PLATFORM_FLAG "$@"
}
