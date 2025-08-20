#!/bin/bash
set -e

mkdir -p build/glibc
cd tmp/glibc

mkdir -p build
cd build

../configure --libdir=/usr/lib --prefix=/usr
make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../../build/glibc) install

cd ../../..

tar -czf done/glibc.tar.gz -C build/glibc .