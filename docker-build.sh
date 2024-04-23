#!/usr/bin/env bash

ROOT_DIR=$( cd $( dirname ${BASH_SOURCE:-$0} ) && pwd )

source $ROOT_DIR/functions.sh

# shellcheck disable=SC2086
docker build $DOCKER_PLATFORM_FLAG "$@"
