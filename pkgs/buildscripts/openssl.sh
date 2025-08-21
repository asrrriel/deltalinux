#!/bin/bash
set -e

mkdir -p build/openssl
cd tmp/openssl-3.5.2

./Configure linux-x86_64 --prefix=/usr --libdir=lib shared
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/openssl) install

cd ../..

tar -czf done/openssl.tar.gz -C build/openssl .