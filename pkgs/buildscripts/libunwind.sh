#!/bin/bash
set -e

mkdir -p build/libunwind
cd tmp/libunwind-1.6.2

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libunwind) install

cd ../..

tar -czf done/libunwind.tar.gz -C build/libunwind .