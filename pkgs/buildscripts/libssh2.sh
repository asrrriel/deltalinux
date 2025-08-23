#!/bin/bash
set -e

mkdir -p build/libssh2
cd tmp/libssh2-1.11.1

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libssh2) install

cd ../..

tar -czf done/libssh2.tar.gz -C build/libssh2 .