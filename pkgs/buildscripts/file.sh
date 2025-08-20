#!/bin/bash
set -e

mkdir -p build/file
cd tmp/file

autoreconf -fiv

./configure --prefix=/usr
make -j$(nproc)

make DESTDIR=$(realpath ../../build/file) install

cd ../..

tar -czf done/file.tar.gz -C build/file .