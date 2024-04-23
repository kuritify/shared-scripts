#!/usr/bin/env bash

ROOT_DIR=$( cd $( dirname ${BASH_SOURCE:-$0} ) && pwd )

source $ROOT_DIR/functions.sh

if [ "${TTY}" ]; then
  # shellcheck disable=SC2086
  docker run --init --rm -it -e HOST_USER_ID="$(id -u)" -e HOST_GROUP_ID="$(id -g)" $DOCKER_PLATFORM_FLAG "$@"
else
  # shellcheck disable=SC2086
  docker run --init --rm -e HOST_USER_ID="$(id -u)" -e HOST_GROUP_ID="$(id -g)" $DOCKER_PLATFORM_FLAG "$@"
fi
