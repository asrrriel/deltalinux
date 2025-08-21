#!/bin/bash
set -e

mkdir -p build/util-linux
cd tmp/util-linux

./autogen.sh

./configure --disable-liblastlog2 --disable-lsclock --enable-passwd --with-pam --prefix=/usr

make CC="gcc -DMAX_CLOCKS=16" -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/util-linux) install

cd ../..

tar -czf done/util-linux.tar.gz -C build/util-linux .