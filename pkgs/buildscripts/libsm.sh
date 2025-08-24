#!/bin/bash
set -e

mkdir -p build/libsm
cd tmp/libsm

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libsm) install

cd ../..

tar -czf done/libsm.tar.gz -C build/libsm .