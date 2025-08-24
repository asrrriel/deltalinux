#!/bin/bash
set -e

mkdir -p build/xorgproto
cd tmp/xorgproto

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-build-docs

make -j$(nproc)

make DESTDIR=$(realpath ../../build/xorgproto) install

cd ../..

tar -czf done/xorgproto.tar.gz -C build/xorgproto .
