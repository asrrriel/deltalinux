#!/bin/bash
set -e

mkdir -p build/xorg-xauth
cd tmp/xauth

autoreconf -fiv

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xorg-xauth) install

cd ../..

tar -czf done/xorg-xauth.tar.gz -C build/xorg-xauth .