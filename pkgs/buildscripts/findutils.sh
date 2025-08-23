#!/bin/bash
set -e

mkdir -p build/findutils
cd tmp/findutils-4.10.0

./configure --prefix=/usr 
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/findutils) install

cd ../..

tar -czf done/findutils.tar.gz -C build/findutils .