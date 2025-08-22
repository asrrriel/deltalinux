#!/bin/bash
set -e

mkdir -p build/keyutils
cd tmp/keyutils-1.6.3

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/keyutils) install

cd ../..

tar -czf done/keyutils.tar.gz -C build/keyutils .