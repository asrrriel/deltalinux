#!/bin/bash
cd tmp/limine

./bootstrap
./configure --prefix=$(realpath ../../builds/limine) --enable-bios-cd --enable-bios --enable-bios-pxe --enable-bios-cd --enable-uefi-x86-64

make

mkdir -p ../../builds/limine

make install