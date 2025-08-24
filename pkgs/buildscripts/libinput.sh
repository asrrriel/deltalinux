#!/bin/bash
set -e

mkdir -p build/libinput
cd tmp/libinput

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddebug-gui=false \
    -Dtests=false \
    -Ddocumentation=false \
    -Dlibwacom=false \
    -Dlua-interpreter=false

ninja -C build

DESTDIR=$(realpath ../../build/libinput) ninja -C build install

cd ../..

tar -czf done/libinput.tar.gz -C build/libinput .