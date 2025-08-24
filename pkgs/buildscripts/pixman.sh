#!/bin/bash
set -e

mkdir -p build/pixman
cd tmp/pixman

meson setup build --prefix=/usr

ninja -C build
DESTDIR=$(realpath ../../build/pixman) ninja -C build install

cd ../..

tar -czf done/pixman.tar.gz -C build/pixman .