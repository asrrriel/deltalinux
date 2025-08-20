#!/bin/bash

mkdir builds/libseccomp
cd tmp/libseccomp

./autogen.sh

cd ../../builds/libseccomp
../../tmp/libseccomp/configure --prefix=/usr
make -j$(nproc)