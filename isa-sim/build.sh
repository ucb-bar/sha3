#!/bin/bash
# Builds the sha3 version of the riscv-isa-sim (spike)
# It will be installed to ./spike-local

SPIKE_SRC=$PWD/spike-sha3
SPIKE_INSTALL=$PWD/spike-local
mkdir -p $SPIKE_INSTALL

# Double check submodule
git submodule status riscv-isa-sim | grep -q "^-"
SUBSTATUS=$?
if [ $SUBSTATUS == 0 ]; then
  echo "Updating riscv-isa-sim submodule:"
  git submodule update --init riscv-isa-sim
fi

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
