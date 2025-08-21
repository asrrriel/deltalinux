#!/bin/bash
set -e

mkdir -p build/pam
cd tmp/linux-pam

meson setup build --prefix=/usr --reconfigure

ninja -C build

meson install --destdir=$(realpath ../../build/pam) -C build

mkdir -p $(realpath ../../build/pam/etc/pam.d/)

cp ../../../configs/pam-rules/* $(realpath ../../build/pam/etc/pam.d/)

cd ../..

tar -czf done/pam.tar.gz -C build/pam .