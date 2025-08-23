#!/bin/bash
set -e

mkdir -p build/libtasn1
cd tmp/libtasn1-v4.20.0

./bootstrap

./configure --prefix=/usr 
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libtasn1) install

cd ../..

tar -czf done/libtasn1.tar.gz -C build/libtasn1 .