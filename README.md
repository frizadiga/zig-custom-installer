# zig-custom-installer

Install the latest Zig compiler to `$ZIG_HOME`.

## Usage

```sh
# download and install latest zig
make install

# check latest version available
make latest

# compare local vs latest version
make check

# add zig to PATH
source zig-link-path.sh
```

## How it works

`zig-install.sh` fetches the [Zig download index](https://ziglang.org/download/index.json), detects your OS and architecture via `uname`, and downloads the matching binary tarball. Falls back to building from source if no binary is available for your platform.
