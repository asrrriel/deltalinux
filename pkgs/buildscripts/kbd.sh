#!/bin/bash
set -e

mkdir -p build/kbd
cd tmp/kbd

./autogen.sh

./configure --prefix=/usr --disable-vlock 

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/kbd) install

cd ../..

tar -czf done/kbd.tar.gz -C build/kbd .