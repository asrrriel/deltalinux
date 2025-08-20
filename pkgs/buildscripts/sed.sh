#!/bin/bash
set -e

mkdir -p build/sed
cd tmp/sed

./bootstrap

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/sed) install

cd ../..

tar -czf done/sed.tar.gz -C build/sed .