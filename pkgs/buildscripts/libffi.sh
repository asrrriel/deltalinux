#!/bin/bash
set -e

mkdir -p build/libffi
cd tmp/libffi-3.4.5

./configure --prefix=/usr 
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libffi) install

cd ../..

tar -czf done/libffi.tar.gz -C build/libffi .