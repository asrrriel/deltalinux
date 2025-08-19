#!/bin/bash

mkdir builds/util-linux
cd tmp/util-linux

./autogen.sh

cd ../../builds/util-linux
../../tmp/util-linux/configure --disable-liblastlog2 --disable-lsclock --prefix=/usr
make CC="gcc -DMAX_CLOCKS=16" -j$(nproc) 

cd ../../