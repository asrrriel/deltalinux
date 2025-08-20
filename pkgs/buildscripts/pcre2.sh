#!/bin/bash
set -e

mkdir -p build/pcre2
cd tmp/pcre2

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/pcre2) install

cd ../..

tar -czf done/pcre2.tar.gz -C build/pcre2 .