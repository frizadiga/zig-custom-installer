#!/bin/bash
# Desc: linking zig bin to the system PATH
# Alias: -

# echo -e "zig-path lingking.."
export _ZIG_PATH="$HOME/Documents/zig"
_zig_path_head="${_ZIG_PATH}/HEAD"
export PATH=$PATH:${_zig_path_head}
