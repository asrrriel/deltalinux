#!/bin/bash
set -e

mkdir -p build/xinit
cd tmp/xinit

autoreconf -fiv

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xinit) install

cd ../..

tar -czf done/xinit.tar.gz -C build/xinit .