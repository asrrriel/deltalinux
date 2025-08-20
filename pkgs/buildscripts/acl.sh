#!/bin/bash
set -e

mkdir -p build/acl
cd tmp/acl

./autogen.sh

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/acl) install

cd ../..

tar -czf done/acl.tar.gz -C build/acl .