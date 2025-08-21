#!/bin/bash
set -e

mkdir -p build/libcap-ng
cd tmp/libcap-ng

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/libcap-ng) install

cd ../..

tar -czf done/libcap-ng.tar.gz -C build/libcap-ng .
