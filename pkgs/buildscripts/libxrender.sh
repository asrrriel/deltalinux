#!/bin/bash
set -e

mkdir -p build/libxrender
cd tmp/libxrender

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxrender) install

cd ../..

tar -czf done/libxrender.tar.gz -C build/libxrender .