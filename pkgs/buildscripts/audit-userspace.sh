#!/bin/bash
set -e

mkdir -p build/audit-userspace
cd tmp/audit-userspace

autoreconf -fiv

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/audit-userspace) install

cd ../..

tar -czf done/audit-userspace.tar.gz -C build/audit-userspace .