#!/bin/bash
set -e

mkdir -p build/git
cd tmp/git

make configure

./configure --prefix=/usr \
    --with-libpcre2 \
    --with-openssl \
    --with-curl \
    --with-expat

make -j$(nproc) all

make -j$(nproc) DESTDIR=$(realpath ../../build/git) install

# make -j$(nproc) DESTDIR=$(realpath ../../build/git) install-doc install-html

cd ../..

tar -czf done/git.tar.gz -C build/git .