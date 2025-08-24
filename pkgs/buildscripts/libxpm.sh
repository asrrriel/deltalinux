#!/bin/bash
set -e

mkdir -p build/libxpm
cd tmp/libxpm

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxpm) install

cd ../..

tar -czf done/libxpm.tar.gz -C build/libxpm .