#!/bin/bash
set -e

mkdir -p build/setxkbmap
cd tmp/setxkbmap

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/setxkbmap) install

cd ../..

tar -czf done/setxkbmap.tar.gz -C build/setxkbmap .