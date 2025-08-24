#!/bin/bash
set -e

mkdir -p build/nettle
cd tmp/nettle-3.10

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/nettle) install

cd ../..

tar -czf done/nettle.tar.gz -C build/nettle .