#!/bin/bash
set -e

mkdir -p build/libsasl
cd tmp/cyrus-sasl-2.1.28

CFLAGS="-O2 -std=gnu89" ./configure --prefix=/usr --disable-docs --disable-tests

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libsasl) install

cd ../..

tar -czf done/libsasl.tar.gz -C build/libsasl .