#!/bin/bash
set -e

mkdir -p build/curl
cd tmp/curl

autoreconf -fiv

./configure --prefix=/usr --with-openssl
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/curl) install

cd ../..

tar -czf done/curl.tar.gz -C build/curl .