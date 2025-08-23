#!/bin/bash
set -e

mkdir -p build/db5.3
cd tmp/db-5.3.28/build_unix

../dist/configure \
    --prefix=/usr \
    --enable-compat185 \
    --enable-shared \
    --enable-static \
    --enable-cxx \
    --enable-dbm \
    --disable-tcl

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../../build/db5.3) install

cd ../../..

tar -czf done/db5.3.tar.gz -C build/db5.3 .