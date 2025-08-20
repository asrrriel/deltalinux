#!/bin/bash
set -e

mkdir -p build/limine
mkdir -p build/limine/boot
mkdir -p build/limine/boot/boot
mkdir -p build/limine/boot/boot/limine
cd tmp/limine

./bootstrap
./configure --prefix=$(realpath ../../build/limine/usr) --enable-bios-cd --enable-bios --enable-bios-pxe --enable-bios-cd --enable-uefi-cd --enable-uefi-x86-64

make -j$(nproc)
make -j$(nproc) install

cp $(realpath ../../build/limine/usr/share/limine/limine-*) $(realpath ../../build/limine/boot/boot/limine)
cp $(realpath ../../build/limine/usr/share/limine/BOOTX64.EFI) $(realpath ../../build/limine/boot/)

cd ../..

tar -czf done/limine.tar.gz -C build/limine .