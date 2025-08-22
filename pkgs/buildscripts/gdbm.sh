#!/bin/bash
set -e

mkdir -p build/gdbm
cd tmp/gdbm-1.26

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/gdbm) install

cd ../..

tar -czf done/gdbm.tar.gz -C build/gdbm .