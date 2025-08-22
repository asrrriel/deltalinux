#!/bin/bash
set -e

mkdir -p build/ldap
cd tmp/openldap-2.6.9

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/ldap) install

cd ../..

tar -czf done/ldap.tar.gz -C build/ldap .