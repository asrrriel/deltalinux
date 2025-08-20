#!/bin/bash

mkdir -p builds/bzip2
cp -r tmp/bzip2/* builds/bzip2

cd builds/bzip2

make -j$(nproc)
mkae -j$(nproc) -f Makefile-libbz2_so