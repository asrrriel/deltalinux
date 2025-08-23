#!/bin/bash
set -e

mkdir -p build/brotli
cd tmp/brotli

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../../build/brotli) install

cd ../../..

tar -czf done/brotli.tar.gz -C build/brotli .