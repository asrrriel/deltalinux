#!/bin/bash
set -e

mkdir -p build/libxcb
cd tmp/libxcb

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-build-docs

make -j$(nproc)

make DESTDIR=$(realpath ../../build/libxcb) install

cd ../..

tar -czf done/libxcb.tar.gz -C build/libxcb .