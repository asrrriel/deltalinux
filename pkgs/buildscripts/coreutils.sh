#!/bin/bash
set -e

mkdir -p build/coreutils
cd tmp/coreutils-9.5

./bootstrap
FORCE_UNSAFE_CONFIGURE=1 ./configure --without-selinux --disable-libcap --prefix=/usr

make -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/coreutils) install

cd ../..

tar -czf done/coreutils.tar.gz -C build/coreutils .