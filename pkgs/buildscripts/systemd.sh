#!/bin/bash
set -e

mkdir -p build/systemd
cd tmp/systemd

meson setup build --prefix=/usr --reconfigure

ninja -C build

meson install --destdir=$(realpath ../../build/systemd) -C build

cd ../..

tar -czf done/systemd.tar.gz -C build/systemd .