#!/bin/bash
set -e

mkdir -p build/libunistring
cd tmp/libunistring-1.3

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libunistring) install

cd ../..

tar -czf done/libunistring.tar.gz -C build/libunistring .