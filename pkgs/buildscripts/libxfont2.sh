#!/bin/bash
set -e

mkdir -p build/libxfont2
cd tmp/libxfont

./autogen.sh

./configure --prefix=/usr --disable-freetype
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxfont2) install

cd ../..

tar -czf done/libxfont2.tar.gz -C build/libxfont2 .