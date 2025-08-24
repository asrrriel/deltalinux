#!/bin/bash
set -e

mkdir -p build/libxinerama
cd tmp/libxinerama

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libxinerama) install

cd ../..

tar -czf done/lilibxineramabxaw.tar.gz -C build/libxinerama .