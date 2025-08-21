#!/bin/bash
set -e

mkdir -p build/kmod
cd tmp/kmod-34

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/kmod) install

cd ../..

tar -czf done/kmod.tar.gz -C build/kmod .