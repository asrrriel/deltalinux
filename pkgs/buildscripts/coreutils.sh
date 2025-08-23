#!/bin/bash
set -e

mkdir -p build/coreutils
cd tmp/coreutils

./bootstrap
FORCE_UNSAFE_CONFIGURE=1 ./configure --disable-libcap --prefix=/usr

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/coreutils) install

cd ../..

tar -czf done/coreutils.tar.gz -C build/coreutils .