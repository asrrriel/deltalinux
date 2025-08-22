#!/bin/bash
set -e

mkdir -p build/libmnl
cd tmp/libmnl

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libmnl) install

cd ../..

tar -czf done/libmnl.tar.gz -C build/libmnl .