#!/usr/bin/env bash

# get the directory of this script
# (from https://stackoverflow.com/a/246128)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# https://gitlab-docs.creationline.com/ee/development/shell_scripting_guide/#code-style-and-format
source "$SCRIPT_DIR/functions.sh"

target_absolute_path=$1
color_opts=""
if [ "${TTY}" ]; then
  color_opts=" --color=always "
fi

docker-run -v "$target_absolute_path:/opt/mounted" --entrypoint sh koalaman/shellcheck-alpine:v0.10.0 -c "find /opt/mounted/ -name '*.sh' | xargs -I {} shellcheck $color_opts --exclude=SC1091 {}"
