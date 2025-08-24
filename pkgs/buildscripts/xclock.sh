#!/bin/bash
set -e

mkdir -p build/xclock
cd tmp/xclock

export LDFLAGS="-lm"
./autogen.sh

./configure --prefix=/usr --without-xft

make -j$(nproc)
make DESTDIR=$(realpath ../../build/xclock) install

cd ../..

tar -czf done/xclock.tar.gz -C build/xclock .