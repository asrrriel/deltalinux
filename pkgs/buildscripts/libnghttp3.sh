#!/bin/bash
set -e

mkdir -p build/libnghttp3
cd tmp/nghttp3

git submodule update --init

autoreconf -fiv

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libnghttp3) install

cd ../..

tar -czf done/libnghttp3.tar.gz -C build/libnghttp3 .