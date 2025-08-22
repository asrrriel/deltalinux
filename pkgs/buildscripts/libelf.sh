#!/bin/bash
set -e

mkdir -p build/elfutils
cd tmp/elfutils

autoreconf -fiv

./configure --prefix=/usr \
    --disable-static \
    --enable-shared \
    --enable-maintainer-mode \
    --disable-biarch \
    --host=x86_64-linux-gnu \
    --build=x86_64-linux-gnu \
    --disable-debuginfod \
    --disable-libdebuginfod

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/elfutils) install

cd ../..

tar -czf done/elfutils.tar.gz -C build/elfutils .