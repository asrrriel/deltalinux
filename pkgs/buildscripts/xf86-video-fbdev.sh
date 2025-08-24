#!/bin/bash
set -e

mkdir -p build/xf86-video-fbdev
cd tmp/xf86-video-fbdev

autoreconf -fiv

./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/xf86-video-fbdev) install

cd ../..

tar -czf done/xf86-video-fbdev.tar.gz -C build/xf86-video-fbdev .