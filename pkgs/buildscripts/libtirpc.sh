#!/bin/bash
set -e

mkdir -p build/libtirpc
cd tmp/libtirpc

chmod a+x autogen.sh # these morons packaged it wrong

./autogen.sh

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/libtirpc) install

cd ../..

tar -czf done/libtirpc.tar.gz -C build/libtirpc .