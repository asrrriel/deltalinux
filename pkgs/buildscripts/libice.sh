#!/bin/bash
set -e

mkdir -p build/libice
cd tmp/libice

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libice) install

cd ../..

tar -czf done/libice.tar.gz -C build/libice .