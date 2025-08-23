#!/bin/bash
# why release tarball you may ask? because the freedesktop morons packaged the autotools wrong these "free"desktop bastards
set -e

mkdir -p build/libbsd
cd tmp/libbsd-0.12.2

./configure --prefix=/usr --disable-static --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libbsd) install

cd ../..

tar -czf done/libbsd.tar.gz -C build/libbsd .