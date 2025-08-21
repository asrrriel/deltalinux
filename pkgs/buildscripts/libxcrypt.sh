#!/bin/bash
set -e

mkdir -p build/libxcrypt
cd tmp/libxcrypt

./autogen.sh

./configure --prefix=/usr --enable-obsolete-api=no
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxcrypt) install

cd ../..

tar -czf done/libxcrypt.tar.gz -C build/libxcrypt .