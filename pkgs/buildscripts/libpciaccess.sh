#!/bin/bash
set -e

mkdir -p build/libpciaccess
cd tmp/libpciaccess

meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build

DESTDIR=$(realpath ../../build/libpciaccess) ninja -C build install

cd ../..

tar -czf done/libpciaccess.tar.gz -C build/libpciaccess .
