#!/bin/bash
set -e

mkdir -p build/libxmu
cd tmp/libxmu

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxmu) install

cd ../..

tar -czf done/libxmu.tar.gz -C build/libxmu .