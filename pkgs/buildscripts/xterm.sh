#!/bin/bash
set -e

mkdir -p build/xterm
cd tmp/xterm-401

./configure --prefix=/usr --disable-freetype

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xterm) install

cd ../..

tar -czf done/xterm.tar.gz -C build/xterm .