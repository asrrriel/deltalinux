#!/bin/bash
set -e

mkdir -p build/libxdmcp
cd tmp/libxdmcp

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-build-docs

make -j$(nproc)

make DESTDIR=$(realpath ../../build/libxdmcp) install

cd ../..

tar -czf done/libxdmcp.tar.gz -C build/libxdmcp .
