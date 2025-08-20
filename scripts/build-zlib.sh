#!/bin/bash

mkdir -p builds/zlib
cd builds/zlib
../../tmp/zlib/configure --prefix=/usr
make -j$(nproc)