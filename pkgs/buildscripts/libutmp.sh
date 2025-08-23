#!/bin/bash
set -e

mkdir -p build/libutempter
cd tmp/libutempter/libutempter

make -j$(nproc)

make DESTDIR=$(realpath ../../../build/libutempter) install

cd ../../..

tar -czf done/libutempter.tar.gz -C build/libutempter .