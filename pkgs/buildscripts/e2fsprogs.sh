#!/bin/bash
set -e

mkdir -p build/e2fsprogs
cd tmp/e2fsprogs-1.47.3

./configure --prefix=/usr

make -j$(nproc) -C lib/et all
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/e2fsprogs) install

cd ../../build/e2fsprogs/usr/lib
ln -sf libcom_err.so.3 libcom_err.so.2
# for iproute2


cd ../../../..

tar -czf done/e2fsprogs.tar.gz -C build/e2fsprogs .