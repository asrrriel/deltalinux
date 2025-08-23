#!/bin/bash
set -e

mkdir -p build/libidn2
cd tmp/libidn2-v2.3.8



./bootstrap 

./configure --prefix=/usr
make -j$(nproc) clean
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libidn2) install

cd ../..

tar -czf done/libidn2.tar.gz -C build/libidn2 .