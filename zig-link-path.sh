#!/bin/bash
# Desc: linking zig bin to the system PATH
# Alias: -

export PATH=$PATH:${ZIG_HOME} && echo "zig is installed and linked to PATH" || echo "zig is not installed"
