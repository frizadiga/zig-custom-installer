#!/bin/bash
# Desc: install latest zig
# Alias: zig-latest

echo -e "checking latest zig version.."

_canonical_pwd=$(pwd)
_download_data=$(curl -s https://ziglang.org/download/index.json)
_latest_version=$(echo $_download_data | jq -r '.master.version')

echo "${_latest_version}"
# echo -e "\n\033[1m${_latest_version}\033[0m\n"

# restore user canonical pwd
cd $_canonical_pwd