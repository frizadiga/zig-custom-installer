#!/bin/bash
# Desc: install latest zig
# Alias: zig-install

# build() {
#   mkdir build
#   cd build
#   cmake ..
#   make install
# }

echo -e "zig-install"

_canonical_pwd=$(pwd)
zig_install_dir="$HOME/Documents/zig/HEAD"

# if not exist then create
if [ ! -d "$zig_install_dir" ]; then
  echo "Path does not exist."
  echo "target install path: $zig_install_dir"
  mkdir -p $zig_install_dir
fi

if [ -d "$zig_install_dir" ]; then
  echo "Path exists."
  cd $zig_install_dir
  rm -rf ./*
else
  echo "[ERR] target install path: $zig_install_dir"
  pwd
  exit 0
fi

_download_data=$(curl https://ziglang.org/download/index.json)
# _download_link=$(echo $_download_data | jq -r ".master.src.tarball")
_download_link=$(echo $_download_data | jq -r '.master."aarch64-macos".tarball')
# _download_link=$(echo $_download_data | jq -r '.master')

echo ${_download_link}
# curl -sL "${_download_link}" | tar -xz -C .
curl -sL "${_download_link}" | tar -xz

_dl_dirname=$(ls) 

echo "download_dirname: $_dl_dirname"

cd $_dl_dirname
mv * ../
# build
cd .. 
rm -rf "./$_dl_dirname"

# restore user canonical pwd
cd $_canonical_pwd