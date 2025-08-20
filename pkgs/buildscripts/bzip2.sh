#!/bin/bash
set -e

mkdir -p build/bzip2
mkdir -p build/bzip2/usr
cd tmp/bzip2

make -j$(nproc)
make PREFIX=$(realpath ../../build/bzip2/usr) install

make clean

make -j$(nproc) -f Makefile-libbz2_so
cp *.so.* $(realpath ../../build/bzip2/usr/lib)

cd ../..

tar -czf done/bzip2.tar.gz -C build/bzip2 .