#!/bin/bash
set -e

mkdir -p build/libcap
cd tmp/libcap

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/libcap) install

cd ../..

tar -czf done/libcap.tar.gz -C build/libcap .
