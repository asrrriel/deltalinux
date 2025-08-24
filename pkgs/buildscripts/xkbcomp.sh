#!/bin/bash
set -e

mkdir -p build/xkbcomp
cd tmp/xkbcomp

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xkbcomp) install

cd ../..

tar -czf done/xkbcomp.tar.gz -C build/xkbcomp .