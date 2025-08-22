#!/bin/bash
set -e

mkdir -p build/libnsl
cd tmp/libnsl

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libnsl) install

cd ../..

tar -czf done/libnsl.tar.gz -C build/libnsl .