#!/bin/bash
set -e

mkdir -p build/mtdev
cd tmp/mtdev-1.1.7

./configure --prefix=/usr \

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/mtdev) install

cd ../..

tar -czf done/mtdev.tar.gz -C build/mtdev .