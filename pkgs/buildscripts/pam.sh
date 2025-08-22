#!/bin/bash
set -e

mkdir -p build/pam
cd tmp/linux-pam

meson setup build --prefix=/usr --reconfigure

ninja -C build

meson install --destdir=$(realpath ../../build/pam) -C build

mkdir -p $(realpath ../../build/pam/etc/pam.d/)

cp ../../../configs/pam-rules/* $(realpath ../../build/pam/etc/pam.d/)

mkdir -p $(realpath ../../build/pam/usr/lib64/)

ln -sf ../lib/security $(realpath ../../build/pam)/usr/lib64/security

chown -R root:root $(realpath ../../build/pam)/usr/lib*/security/*.so
chmod -R 644 $(realpath ../../build/pam)/usr/lib*/security/*.so

chown -R root:root $(realpath ../../build/pam)/etc/* 
chmod -R 644 $(realpath ../../build/pam)/etc/* 

cd ../..

tar -czf done/pam.tar.gz -C build/pam .