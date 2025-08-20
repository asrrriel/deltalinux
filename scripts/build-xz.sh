#!/bin/bash

mkdir builds/xz
cd tmp/xz

./autogen.sh

cd ../../builds/xz
../../tmp/xz/configure --prefix=/usr
make -j$(nproc)