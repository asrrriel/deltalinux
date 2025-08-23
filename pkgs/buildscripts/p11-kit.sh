#!/bin/bash
set -e

mkdir -p build/p11-kit
cd tmp/p11-kit-0.25.5

CFLAGS="-std=gnu11" ./configure --prefix=/usr 
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/p11-kit) install

cd ../..

tar -czf done/p11-kit.tar.gz -C build/p11-kit .