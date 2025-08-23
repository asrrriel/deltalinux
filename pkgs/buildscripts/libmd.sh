#!/bin/bash
set -e

mkdir -p build/libmd
cd tmp/libmd-1.1.0

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libmd) install

cd ../..

tar -czf done/libmd.tar.gz -C build/libmd .