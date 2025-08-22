#!/bin/bash
set -e

mkdir -p build/e2fsprogs
cd tmp/e2fsprogs-1.47.3

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/e2fsprogs) install

cd ../..

tar -czf done/e2fsprogs.tar.gz -C build/e2fsprogs .