#!/bin/bash
set -e

mkdir -p build/libxcvt
cd tmp/libxcvt

meson setup build --prefix=/usr --buildtype=release

ninja -C build
DESTDIR=$(realpath ../../build/libxcvt) ninja -C build install

cd ../..

tar -czf done/libxcvt.tar.gz -C build/libxcvt .