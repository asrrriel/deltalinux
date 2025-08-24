#!/bin/bash
set -e

mkdir -p build/libfontenc
cd tmp/libfontenc

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libfontenc) install

cd ../..

tar -czf done/libfontenc.tar.gz -C build/libfontenc .