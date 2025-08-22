#!/bin/bash
set -e

mkdir -p build/libbpf
cd tmp/libbpf

cd src

make -j$(nproc) BUILD_STATIC_ONLY=y
make -j$(nproc) DESTDIR=$(realpath ../../../build/libbpf) PREFIX=/usr install

cd ../../..

tar -czf done/libbpf.tar.gz -C build/libbpf .