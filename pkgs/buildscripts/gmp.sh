#!/bin/bash
set -e

mkdir -p build/gmp
cd tmp/gmp-6.3.0

ABI=64 CFLAGS="-std=c99" ./configure --build=$CHOST --prefix=/usr --enable-cxx --enable-fat
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/gmp) install

cd ../..

tar -czf done/gmp.tar.gz -C build/gmp .