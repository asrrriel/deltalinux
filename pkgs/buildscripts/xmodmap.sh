#!/bin/bash
set -e

mkdir -p build/xorg-xmodmap
cd tmp/xmodmap

autoreconf -fiv

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xorg-xmodmap) install

cd ../..

tar -czf done/xorg-xmodmap.tar.gz -C build/xorg-xmodmap .