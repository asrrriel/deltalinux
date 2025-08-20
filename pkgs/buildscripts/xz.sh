#!/bin/bash
set -e

mkdir -p build/xz
cd tmp/xz

./autogen.sh
./configure --prefix=/usr

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/xz) install

cd ../..

tar -czf done/xz.tar.gz -C build/xz .