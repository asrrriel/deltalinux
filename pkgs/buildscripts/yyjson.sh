#!/bin/bash
set -e

mkdir -p build/yyjson
cd tmp/yyjson

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../../build/yyjson) install

cd ../../..

tar -czf done/yyjson.tar.gz -C build/yyjson .