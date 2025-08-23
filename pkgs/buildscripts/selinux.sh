#!/bin/bash
set -e

mkdir -p build/selinux
cd tmp/selinux

make -j$(nproc) -C libsepol \
    PREFIX=/usr \
    DESTDIR=$(realpath ../../build/selinux) \
    install

make -j$(nproc) -C libselinux \
    PREFIX=/usr \
    SHLIBDIR=/usr/lib \
    DESTDIR=$(realpath ../../build/selinux) \
    install

cd ../..

tar -czf done/selinux.tar.gz -C build/selinux .