#!/bin/bash
set -e

mkdir -p build/fastfetch

cp ../configs/logo.txt tmp/fastfetch/src/logo/ascii/deltalinux.txt

cd tmp/fastfetch

git apply ../../../patches/logo.patch

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../../build/fastfetch) install

cd ../../..

tar -czf done/fastfetch.tar.gz -C build/fastfetch .