#!/bin/bash
set -e

# Build bare-metal tests
echo "Building bare-metal tests"
make -C tests/bare

echo "Building linux tests"
make -C tests/linux

if [ ! -f linux/README ]; then
  echo ""
  echo "WARNING: Linux submodule not initialized, linux-based workloads will not work." >&2 
fi
