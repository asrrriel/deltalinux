#!/bin/bash
set -e

mkdir -p build/iproute2
cd tmp/iproute2

make configure HAVE_SELINUX=n

make -j$(nproc) HAVE_SELINUX=n
make -j$(nproc) DESTDIR=$(realpath ../../build/iproute2) install HAVE_SELINUX=n

cd ../..

tar -czf done/iproute2.tar.gz -C build/iproute2 .