#!/bin/bash
set -e

mkdir -p build/python
cd tmp/cpython

./configure \
    --prefix=/usr \
    --enable-shared \
    --enable-optimizations \
    --with-lto \
    --with-system-expat \
    --with-system-ffi \
    --enable-loadable-sqlite-extensions \
    --with-dbmliborder=gdbm:ndbm \
    --without-ensurepip

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/python) install

cd ../..

tar -czf done/python.tar.gz -C build/python .