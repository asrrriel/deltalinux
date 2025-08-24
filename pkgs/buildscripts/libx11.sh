#!/bin/bash
set -e

mkdir -p build/libx11
cd tmp/libx11

autoreconf -fiv

./configure --prefix=/usr --disable-specs --without-xmlto --without-fop

make -j$(nproc)
make DESTDIR=$(realpath ../../build/libx11) install

cd ../..

tar -czf done/libx11.tar.gz -C build/libx11 .