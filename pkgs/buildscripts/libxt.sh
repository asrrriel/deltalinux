#!/bin/bash
set -e

mkdir -p build/libxt
cd tmp/libxt

autoreconf -fiv

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxt) install

cd ../..

tar -czf done/libxt.tar.gz -C build/libxt .