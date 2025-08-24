#!/bin/bash
set -e

mkdir -p build/libevdev
cd tmp/libevdev

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled \
    -Ddocumentation=disabled

ninja -C build

DESTDIR=$(realpath ../../build/libevdev) ninja -C build install

cd ../..

tar -czf done/libevdev.tar.gz -C build/libevdev .