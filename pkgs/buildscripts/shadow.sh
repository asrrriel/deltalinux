#!/bin/bash
set -e

mkdir -p build/shadow
cd tmp/shadow

./autogen.sh --without-libpam --without-selinux --without-utmp --without-libbsd

./configure --prefix=/usr --without-libpam --without-selinux --without-utmp --without-libbsd
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/shadow) install

cd ../..

tar -czf done/shadow.tar.gz -C build/shadow .