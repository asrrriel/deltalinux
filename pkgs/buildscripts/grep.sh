#!/bin/bash
set -e

mkdir -p build/grep
cd tmp/grep-3.11

./bootstrap

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/grep) install

cd ../..

tar -czf done/grep.tar.gz -C build/grep .