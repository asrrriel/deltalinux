#!/bin/bash
set -e

mkdir -p build/libepoxy
cd tmp/libepoxy

meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build

DESTDIR=$(realpath ../../build/libepoxy) ninja -C build install

cd ../..

tar -czf done/libepoxy.tar.gz -C build/libepoxy .
