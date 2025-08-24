#!/bin/bash
set -e

mkdir -p build/libxext
cd tmp/libxext

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxext) install

cd ../..

tar -czf done/libxext.tar.gz -C build/libxext .