#!/bin/bash
set -e

mkdir -p build/zstd
cd tmp/zstd

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/zstd) install

cd ../..

tar -czf done/zstd.tar.gz -C build/zstd .
