#!/bin/bash
set -e

mkdir -p build/twm
cd tmp/twm

autoreconf -fiv

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/twm) install

cd ../..

tar -czf done/twm.tar.gz -C build/twm .