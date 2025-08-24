#!/bin/bash
set -e

mkdir -p build/libxau
cd tmp/libxau

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-build-docs

make -j$(nproc)

make DESTDIR=$(realpath ../../build/libxau) install

cd ../..

tar -czf done/libxau.tar.gz -C build/libxau .