#!/bin/bash
set -e

mkdir -p build/bash
cd tmp/bash-5.2

./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/bash) install

ln -sf ./bash $(realpath ../../build/bash)/usr/bin/sh

cd ../..

tar -czf done/bash.tar.gz -C build/bash .