#!/bin/bash
# Desc: install latest zig
# Alias: zig-install

echo "zig-install"

zig_install_dir="$ZIG_HOME"

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

_download_data=$(curl -s https://ziglang.org/download/index.json)

# map `uname -m` to Zig arch name
case $(uname -m) in
  aarch64|arm64)       _zig_arch="aarch64" ;;
  x86_64|amd64)        _zig_arch="x86_64" ;;
  i686|i386|x86)       _zig_arch="x86" ;;
  armv7l|armv6l|arm)   _zig_arch="arm" ;;
  riscv64)              _zig_arch="riscv64" ;;
  ppc64le|powerpc64le)  _zig_arch="powerpc64le" ;;
  loongarch64)          _zig_arch="loongarch64" ;;
  s390x)                _zig_arch="s390x" ;;
  *)                    _zig_arch="$(uname -m)" ;;
esac

# map `uname -s` to Zig OS name
case $(uname -s) in
  Linux)                _zig_os="linux" ;;
  Darwin)               _zig_os="macos" ;;
  FreeBSD)              _zig_os="freebsd" ;;
  NetBSD)               _zig_os="netbsd" ;;
  OpenBSD)              _zig_os="openbsd" ;;
  MINGW*|MSYS*|CYGWIN*) _zig_os="windows" ;;
  *)                    _zig_os="$(uname -s | tr '[:upper:]' '[:lower:]')" ;;
esac

_zig_key="${_zig_arch}-${_zig_os}"

# try binary download; fall back to source tarball
_download_link=$(echo $_download_data | jq -r ".master.\"${_zig_key}\".tarball // .master.src.tarball")

echo "download link: ${_download_link}"
curl -sL "${_download_link}" | tar -xJ --strip-components=1 && echo "downloaded" || { echo "failed to download"; exit 1; }

echo "zig installed to ${ZIG_HOME}"
