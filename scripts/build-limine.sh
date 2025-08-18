#!/bin/bash
cd tmp/limine

./bootstrap
./configure --prefix=$(realpath ../../builds/limine) --enable-all

make

mkdir -p ../../builds/limine

make install