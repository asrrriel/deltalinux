#!/bin/bash
set -e

mkdir -p build/xf86-input-libinput
cd tmp/xf86-input-libinput

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared \
    --without-libwacom

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xf86-input-libinput) install

cd ../..

tar -czf done/xf86-input-libinput.tar.gz -C build/xf86-input-libinput .