#!/bin/bash
set -e

SPIKE_SRC=$PWD/esp-isa-sim
SPIKE_INSTALL=$PWD/spike-local
mkdir -p $SPIKE_INSTALL

# Build the custom spike
if [ ! -d $SPIKE_SRC/build ]; then
  echo "Configuring Spike:"
  mkdir -p $SPIKE_SRC/build
  pushd $SPIKE_SRC/build
  ../configure --with-fesvr=$RISCV --prefix=$SPIKE_INSTALL
  popd
fi

echo "Building Spike"
pushd $SPIKE_SRC/build
make -j
make install
popd

