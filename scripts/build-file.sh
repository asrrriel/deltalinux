#!/bin/bash

mkdir -p builds/file
cd tmp/file

autoreconf -fiv

cd ../../builds/file

../../tmp/file/configure --prefix=/usr
make -j$(nproc)