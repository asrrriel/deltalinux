#!/bin/bash
set -e

mkdir -p build/xorg-xrdb
cd tmp/xrdb

autoreconf -fiv

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xorg-xrdb) install

cd ../..

tar -czf done/xorg-xrdb.tar.gz -C build/xorg-xrdb .