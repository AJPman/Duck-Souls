#!/bin/sh
echo -ne '\033c\033]0;absolute final\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/absolute_final_linux.x86_64" "$@"
