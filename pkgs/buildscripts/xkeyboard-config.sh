#!/bin/bash
set -e

mkdir -p build/xkeyboard-config
cd tmp/xkeyboard-config

meson setup build --prefix=/usr --buildtype=release

ninja -C build
DESTDIR=$(realpath ../../build/xkeyboard-config) ninja -C build install

cd ../..

tar -czf done/xkeyboard-config.tar.gz -C build/xkeyboard-config .