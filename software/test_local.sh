#!/bin/bash
set -e

marshal test -s marshal-configs/sha3-bare-rocc.yaml
if [ $? != 0 ]; then
  echo "Bare-metal test failed"
fi

marshal -d test -s marshal-configs/sha3-linux-test.yaml
if [ $? != 0 ]; then
  echo "Linux unit test failed"
fi

marshal -d test -s marshal-configs/sha3-linux-jtr-test.yaml
if [ $? != 0 ]; then
  echo "Linux John the Ripper test failed"
fi
