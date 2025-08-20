#!/bin/bash
set -e

mkdir -p build/readline
cd tmp/readline

./configure --prefix=/usr

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/readline) install

cd ../..

tar -czf done/readline.tar.gz -C build/readline .