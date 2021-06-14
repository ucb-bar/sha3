# SHA3 Software Workloads

This is an example set of workloads that uses the SHA3 rocc accelerator.

# Getting Started

Running these workloads require a modified Spike simulator that supports the SHA3
custom extension, which can be found [here](https://github.com/ucb-bar/esp-isa-sim). If
you are using Chipyard, you should install the esp-tools toolchain which comes
with the appropriate version of Spike.

To run linux-based workloads, you'll also need to update the linux submodule:

    cd sha3
    git submodule update --init software/linux

These workloads all use FireMarshal to build and test. All the examples in this
README assume that marshal is on your PATH (the default if you've set up
chipyard).

The first time you build a workload using FireMarshal, the `build.sh` script
will be run automatically. This script compiles all of our dependencies (e.g.
Linux and Buildroot). The first time building will take a long time since some
of these dependencies take a long time to build (especially Buildroot).
Subsequent builds will go faster since FireMarshal caches dependencies.

# Workloads

All workload configuration files are in `marshal-configs`.

## Bare-Metal

There are two different bare-metal workloads that are packaged in this
repository. `sha3-bare-rocc` uses the SHA3 accelerator to run a SHA3
computation. The `sha3-bare-sw` instead computes the
SHA3 hash using software only.

    sha3-bare-rocc.yaml
    sha3-bare-sw.yaml

To build either binary run:

    marshal build marshal-configs/sha3-bare-rocc.yaml
    marshal build marshal-configs/sha3-bare-sw.yaml

To run the test interactively run:

    marshal launch --spike marshal-configs/sha3-bare-rocc.yaml
    marshal launch --spike marshal-configs/sha3-bare-sw.yaml

To run the unit test run:

    marshal test --spike marshal-configs/sha3-bare-rocc.yaml
    marshal test --spike marshal-configs/sha3-bare-sw.yaml

## Linux

***sha3-linux*.yaml***

The linux-based workloads can boot in qemu so long as you don't actually access
the rocc accelerator. To use the custom hardware, you must boot in spike:

    marshal --no-disk build marshal-configs/sha3-linux.yaml
    marshal --no-disk launch --spike marshal-configs/sha3-linux.yaml

The `--no-disk` option tells marshal to build the root filesystem into the
binary as an initial ram filesystem (this is needed because spike does not
include a disk model). The `--spike` option tells FireMarshal to boot the image
in spike so we can use the sha3 functional model (FireMarshal uses QEMU by
default).

### Interactive Linux

***sha3-linux.yaml***

This workload boots buildroot and uses the SHA3 accelerator as a user-space
program. The basic workload boots into an interactive session. You can look at
`/root` in the target for binaries to execute. `sha3-sw` acts as a baseline and
computes the hash in software only. `sha3-rocc` uses the rocc accelerator to
compute the hash.

### Automated Linux Test

***sha3-linux-test.yaml***

This workload inherits from sha3-linux.yaml and adds a 'command' field that
tells FireMarshal to run a command automatically when the workload runs. It also
adds a 'testing' field that provides a reference output for FireMarshal to compare
against when running `marshal test marshal-configs/sha3-linux-test.yaml`. Note that
in FireMarshal, the reference output needs to match some subset of the actual
output (notice that `test-reference/linux/sha3-linux-test/uartlog` only has the
test output, while the actual program output is much longer.

To use this workload, try running:

    marshal --no-disk test --spike marshal-configs/sha3-linux-test.yaml

# Key Components of this Workload

## linux

A fork of Linux with some minor changes to support the sha3 accelerator.

## marshal-configs

This directory contains our FireMarshal configurations for each workload.

## test-reference

This directory contains reference outputs for each of our automated test
workloads.

## tests 

Contains simple unit tests for the accelerator. These will be incorproated into
various test workloads. They are cross-compiled by `build.sh` (called
automatically by FireMarshal when building workloads).

## jtr

Contains a fork of John the Ripper that targets the SHA3 accelerator. This
serves as our main end-to-end benchmark.
