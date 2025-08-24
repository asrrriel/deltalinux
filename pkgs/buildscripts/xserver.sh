#!/bin/bash
set -e

mkdir -p build/xorg-xserver
cd tmp/xserver

meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --buildtype=release \
    -Dglamor=false \
    -Dglx=false \
    -Ddri1=false \
    -Ddri2=false \
    -Ddri3=false \
    -Dxvfb=true \
    -Dxnest=true \
    -Dxephyr=true \
    -Dxwayland=false

ninja -C build

DESTDIR=$(realpath ../../build/xorg-xserver) ninja -C build install

cd ../..


tar -czf done/xorg-xserver.tar.gz -C build/xorg-xserver .
