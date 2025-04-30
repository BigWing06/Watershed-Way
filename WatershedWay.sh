#!/bin/sh
echo -ne '\033c\033]0;Watershed Plinko Board\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/WatershedWay.arm64" "$@"
