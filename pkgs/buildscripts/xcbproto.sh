#!/bin/bash
set -e

mkdir -p build/xcbproto
cd tmp/xcbproto

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-build-docs

make -j$(nproc)

make DESTDIR=$(realpath ../../build/xcbproto) install

cd ../..

tar -czf done/xcbproto.tar.gz -C build/xcbproto .