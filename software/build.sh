#!/bin/bash
set -e

# Build spike
pushd ../isa-sim/
./build.sh
popd

# Build bare-metal tests
echo "Building bare-metal tests"
make -C benchmarks/bare

echo "Building linux tests"
make -C benchmarks/linux

if [ ! -f linux/README ]; then
  echo ""
  echo "WARNING: Linux submodule not initialized, linux-based workloads will not work." >&2 
fi
