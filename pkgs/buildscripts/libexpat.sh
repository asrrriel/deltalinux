#!/bin/bash
set -e

mkdir -p build/libexpat
cd tmp/libexpat/expat

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../../build/libexpat) install

cd ../../..

tar -czf done/libexpat.tar.gz -C build/libexpat .