#!/bin/bash

mkdir builds/coreutils

cd tmp/coreutils

./bootstrap

cd ../../builds/coreutils
../../tmp/coreutils/configure --without-selinux --disable-libcap --prefix=/usr

make -j$(nproc)