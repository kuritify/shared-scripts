#!/usr/bin/env bash

ROOT_DIR=$( cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd )

source "$ROOT_DIR/functions.sh"

CONTAINER_PLATFORM_FLAG=""
if [[ $APPLE_SILICON ]]; then
  CONTAINER_PLATFORM_FLAG="--container-architecture linux/amd64"
fi


cd "$1"

shift
# shellcheck disable=SC2086
act $CONTAINER_PLATFORM_FLAG "$@"
