#!/bin/bash
set -e

mkdir -p build/iproute2
cd tmp/iproute2

make configure

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/iproute2) install
cd ../..

tar -czf done/iproute2.tar.gz -C build/iproute2 .