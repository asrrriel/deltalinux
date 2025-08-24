#!/bin/bash
set -e

mkdir -p build/libdrm
cd tmp/drm

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dudev=true \
    -Dvalgrind=disabled \
    -Dfreedreno=enabled \
    -Dfreedreno-kgsl=true \
    -Dinstall-test-programs=false

ninja -C build

DESTDIR=$(realpath ../../build/libdrm) ninja -C build install

cd ../..

tar -czf done/libdrm.tar.gz -C build/libdrm .