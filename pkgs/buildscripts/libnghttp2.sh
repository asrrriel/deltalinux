#!/bin/bash
set -e

mkdir -p build/libnghttp2
cd tmp/nghttp2-1.66.0

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libnghttp2) install

cd ../..

tar -czf done/libnghttp2.tar.gz -C build/libnghttp2 .