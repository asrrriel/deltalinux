#!/bin/bash
set -e

mkdir -p build/linux
mkdir -p build/linux/boot

cp ../configs/linux.config tmp/linux/.config

cd tmp/linux

make -j$(nproc) oldconfig

make -j$(nproc)

cd ../..

cp tmp/linux/arch/x86/boot/bzImage build/linux/boot/vmlinuz

tar -czf done/linux.tar.gz -C build/linux .