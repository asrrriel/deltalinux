#!/bin/bash
set -e

mkdir -p build/libxrandr
cd tmp/libxrandr

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxrandr) install

cd ../..

tar -czf done/libxrandr.tar.gz -C build/libxrandr .