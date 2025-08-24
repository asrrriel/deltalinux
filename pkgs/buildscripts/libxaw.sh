#!/bin/bash
set -e

mkdir -p build/libxaw
cd tmp/libxaw

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxaw) install

cd ../..

tar -czf done/libxaw.tar.gz -C build/libxaw .