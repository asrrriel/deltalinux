#!/bin/bash
set -e

mkdir -p build/ralsei
mkdir -p build/ralsei/sbin
cd ../ralsei

make -j$(nproc)

make DESTDIR=../pkgs/build/ralsei install
cd ../pkgs

tar -czf done/ralsei.tar.gz -C build/ralsei .