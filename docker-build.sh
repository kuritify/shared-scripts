#!/usr/bin/env bash

ROOT_DIR=$( cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd )

source "$ROOT_DIR/functions.sh"

docker-build
