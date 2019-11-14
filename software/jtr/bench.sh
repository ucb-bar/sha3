#!/bin/sh
set -e

export HOME=/root
cd /root/sha3

echo
echo 'John the Ripper: self-test/benchmark [baseline]'
john --test=1 --format=Raw-SHA3-256
echo 'John the Ripper: self-test/benchmark [RoCC]'
john --test=1 --format=Raw-SHA3-256-rocc

echo 'John the Ripper: wordlist crack mode [RoCC]'
rm -f short.pot
time john --wordlist --format=Raw-SHA3-256-rocc --pot='short.pot' short.txt
echo

poweroff
