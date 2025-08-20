#!/bin/bash
set -e

mkdir -p build/zlib
cd tmp/zlib

./configure --prefix=/usr

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/zlib) install

cd ../..

tar -czf done/zlib.tar.gz -C build/zlib .