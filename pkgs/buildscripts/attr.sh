#!/bin/bash
set -e

mkdir -p build/attr
cd tmp/attr-2.5.2

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/attr) install

cd ../..

tar -czf done/attr.tar.gz -C build/attr .