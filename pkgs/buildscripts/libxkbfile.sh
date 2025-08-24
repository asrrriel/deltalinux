#!/bin/bash
set -e

mkdir -p build/libxkbfile
cd tmp/libxkbfile

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxkbfile) install

cd ../..

tar -czf done/libxkbfile.tar.gz -C build/libxkbfile .