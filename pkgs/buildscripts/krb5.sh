#!/bin/bash
set -e

mkdir -p build/krb5
cd tmp/krb5-1.22.1

./src/configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/krb5) install

cd ../..

tar -czf done/krb5.tar.gz -C build/krb5 .