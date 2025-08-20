#!/bin/bash
set -e

mkdir -p build/libseccomp
cd tmp/libseccomp

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/libseccomp) install

cd ../..

tar -czf done/libseccomp.tar.gz -C build/libseccomp .