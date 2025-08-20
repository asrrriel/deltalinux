#!/bin/bash
set -e

mkdir -p build/tar
cd tmp/tar-1.35

autoreconf -fiv

FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/tar) install

cd ../..

tar -czf done/tar.tar.gz -C build/tar .