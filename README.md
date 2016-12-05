rocc-template
=============
Note - Compatible with rocket-chip:master (Commit ID 4234cff0744bae1f602b84011dbef261584c0a27)

If cloned into rocket-chip directory use

    ./install-symlinks

You can then test it using the emulator

    cd ../emulator && make CONFIG=Sha3DefaultConfig run-asm-tests

You can emulate the software implementation of sha3 by running

    ./emulator-Top-Sha3DefaultConfig pk ../sha3/tests/sha3-sw.rv +dramsim

or

    ./emulator-Top-Sha3DefaultConfig pk ../sha3/tests/sha3-sw-bm.rv +dramsim

You can emulate the accelerated sha3 by running

    ./emulator-Top-Sha3DefaultConfig pk ../sha3/tests/sha3-rocc-bm.rv +dramsim

or 

    ./emulator-Top-Sha3DefaultConfig pk ../sha3/tests/sha3-rocc.rv +dramsim

The -bm versions of the code omit the print statements and will complete faster.
