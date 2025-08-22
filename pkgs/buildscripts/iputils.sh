#!/bin/bash
set -e

mkdir -p build/iputils
cd tmp/iputils

meson setup build --prefix=/usr --buildtype=release -DUSE_IDN=false

ninja -C build
DESTDIR=$(realpath ../../build/iputils) ninja -C build install

cd ../..

tar -czf done/iputils.tar.gz -C build/iputils .