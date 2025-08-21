#!/bin/bash
set -e

mkdir -p build/libxml2
cd tmp/libxml2

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxml2) install

cd ../..

tar -czf done/libxml2.tar.gz -C build/libxml2 .