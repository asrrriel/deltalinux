#!/bin/bash
set -e

mkdir -p build/libpsl
cd tmp/libpsl

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libpsl) install

cd ../..

tar -czf done/libpsl.tar.gz -C build/libpsl .