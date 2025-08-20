#!/bin/bash
set -e

mkdir -p build/nano
cd tmp/nano

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/nano) install

cd ../..

tar -czf done/nano.tar.gz -C build/nano .