#!/bin/bash
set -e

mkdir -p build/gzip
cd tmp/gzip

./bootstrap

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/gzip) install

cd ../..

tar -czf done/gzip.tar.gz -C build/gzip .